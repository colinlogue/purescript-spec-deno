module Test.Spec.Runner.Deno.Util where

import Prelude

import Data.Either (Either(..))
import Effect (Effect)
import Effect.Aff (Aff, Error, makeAff)
import Effect.Uncurried (EffectFn1, EffectFn3, EffectFn4, mkEffectFn1, runEffectFn1, runEffectFn3, runEffectFn4)

foreign import _readTextFile :: EffectFn3 String (EffectFn1 String Unit) (EffectFn1 Error Unit) Unit

readTextFile :: String -> Aff String
readTextFile path = makeAff \cb ->
  let
    onSuccess = cb <<< Right
    onFailure = cb <<< Left
  in
    runEffectFn3 _readTextFile path (mkEffectFn1 onSuccess) (mkEffectFn1 onFailure) *> mempty

foreign import _writeTextFile :: EffectFn4 String String (Effect Unit) (EffectFn1 Error Unit) Unit

writeTextFile :: String -> String -> Aff Unit
writeTextFile path content = makeAff \cb ->
  let
    onSuccess = cb (Right unit)
    onFailure = cb <<< Left
  in
    runEffectFn4 _writeTextFile path content onSuccess (mkEffectFn1 onFailure) *> mempty

foreign import _exit :: EffectFn1 Int Unit

exit :: Int -> Effect Unit
exit code = runEffectFn1 _exit code

[![build](https://github.com/purescript-spec/purescript-spec-node/actions/workflows/build.yml/badge.svg)](https://github.com/purescript-spec/purescript-spec-node/actions/workflows/build.yml)

# PureScript Spec test runner for Deno

The default runner for your tests if you're running on Deno.

Documentation and examples here: https://purescript-spec.github.io/purescript-spec/running/

The documentation refers to using a Node-based runner, but the Deno version is the same except for using the Deno API rather than the Node API in foreign calls.

## Deno setup

Because `purescript-spec` itself use Node libraries, you will need to provide an [import map](https://docs.deno.com/runtime/fundamentals/modules/#managing-third-party-modules-and-libraries) to tell Deno how to find them. The simplest way is to add this to your `deno.json`:

```json
{
  "imports": {
    "child_process": "node:child_process",
    "process": "node:process",
    "util": "node:util"
  }
}
```

You will also need to use Deno to run the tests. You can do this with a script `test.ts`, assuming `./output` is the path to your compiled output:

```typescript
import { main } from './output/Test.Main/index.js';

main();
```

Then you can run the tests with:

```
deno run --allow-all test.ts
```

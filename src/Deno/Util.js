
export const _readTextFile = (path, onSuccess, onError) => {
  Deno.readTextFile(path)
    .then(onSuccess)
    .catch(onError);
};


export const _writeTextFile = ( path, data, onSuccess, onError) => {
  Deno.writeTextFile(path, data)
    .then(onSuccess)
    .catch(onError);
};

export const _exit = (code) => {
  Deno.exit(code);
};

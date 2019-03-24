# @bouzuya/create-version-module

version module generator

## Usage

```
npm init @bouzuya/version-module src/version.ts
```

## Example

```
$ cat package.json
{ "version": "0.1.0" }

$ # npx @bouzuya/create-version-module --no-comment src/version.ts
$ npm init @bouzuya/version-module --no-comment src/version.ts

$ cat src/version.ts
const version = '0.1.0';
export { version };

```

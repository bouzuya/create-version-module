# @bouzuya/create-version-module

version module generator

## Usage

```
npm init @bouzuya/version-module src/version.js
```

## Example

```
$ cat package.json
{ "version": "0.1.0" }

$ # npx @bouzuya/create-version-module --no-comment src/version.js
$ npm init @bouzuya/version-module --no-comment src/version.js

$ cat src/version.js
const version = '0.1.0';
export { version };

$ # supported languages: JavaScript, PureScript, TypeScript
$ npm init @bouzuya/version-module --language PureScript --no-comment src/version.purs

$ cat src/version.purs
module Version
  ( version
  ) where

version :: String
version = "0.1.0"

```

## How to build

```bash
npm install
```

## License

[MIT](LICENSE)

## Author

[bouzuya][user] &lt;[m@bouzuya.net][email]&gt; ([https://bouzuya.net/][url])

[user]: https://github.com/bouzuya
[email]: mailto:m@bouzuya.net
[url]: https://bouzuya.net/

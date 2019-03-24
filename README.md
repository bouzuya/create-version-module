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

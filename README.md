# mp4box-static

**[mp4box](https://gpac.wp.imt.fr/) static binaries for Mac OSX, Linux, and Windows.**

Supports macOS (64-bit), Linux (32 and 64-bit) and Windows (32 and 64-bit). The current mp4box version is `0.7.2`.

*Note:* The version of `mp4box-static` follows [SemVer](http://semver.org). When releasing new versions, **we do *not* consider breaking changes in `MP4Box` itself**, but only the JS interface (see below). To stop `mp4box-static` from breaking your code by getting updated, [lock the version down](https://docs.npmjs.com/files/package.json#dependencies) or use a [lockfile](https://docs.npmjs.com/files/package-lock.json).

## Installation

This module is installed via npm:

``` bash
$ npm install @douglassllc/mp4box-static
```

## Example Usage

Returns the path of a statically linked mp4box binary on the local filesystem.

``` js
var mp4box = require('mp4box-static');
console.log(mp4box.path);
// /Users/demo/mp4box-static/bin/darwin/x64/mp4box
```

## Sources of the binaries

[The build script](build/index.sh) downloads binaries from this location:

- [macOS, Linux, and Windows builds](https://download.tsi.telecom-paristech.fr/gpac)

## Building the project

The `unzip`, `tar`, `7zr`, and `xz` CLI executables need to be installed. On macOS, use `brew install p7zip gnu-tar xz`.


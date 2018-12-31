# mp4box-static

**[MP4Box](https://gpac.wp.imt.fr/) static binaries for Mac, Linux, and Windows.**

Supports macOS (64-bit), Linux (32 and 64-bit) and Windows (32 and 64-bit). The current MP4Box version is `0.7.2`.

*Note:* The version of `mp4box-static` follows [SemVer](http://semver.org). When releasing new versions, **we do *not* consider breaking changes in `MP4Box` itself**, but only the JS interface (see below). To stop `mp4box-static` from breaking your code by getting updated, [lock the version down](https://docs.npmjs.com/files/package.json#dependencies) or use a [lockfile](https://docs.npmjs.com/files/package-lock.json).

## What get's installed

The minimal required EXE and DLLs are installed.  Currently only `-force-cat` feature of MP4Box has been tested.  Other DLLs might be required to support other MP4Box features. 

## Installation

This module is installed via npm:

``` bash
$ npm install @douglassllc/mp4box-static
```

## Example Usage

Returns the path of a statically linked MP4Box binary on the local filesystem.

``` js
var mp4box = require('@douglassllc/mp4box-static');
console.log(mp4box.path);
// /Users/demo/mp4box-static/bin/darwin/x64/MP4Box
```

## Sources of the binaries

[The build script](build/index.sh) downloads binaries from this location:

- [GPAC Multimedia Open Source Project](https://download.tsi.telecom-paristech.fr/gpac)

## Building the project

The `unzip`, `tar`, `7z`, and `xz` CLI executables need to be installed. On macOS, use `brew install p7zip gnu-tar xz`.

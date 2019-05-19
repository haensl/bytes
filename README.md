bytes
=====================

[![Build Status](https://travis-ci.org/haensl/bytes.svg?branch=master)](https://travis-ci.org/haensl/bytes)

**bytes** is a bash utility to calculate the disk space consumed by files within a directory.

### Installation

#### Linux/OSX from source
1. Clone this repository
2. `cd` into the repository
3. `make install`

#### OSX via [Homebrew](https://brew.sh/)
1. `brew tap haensl/haensl`
2. `brew install bytes`

### Usage

To calculate the total number of **bytes** consumed by all *visible (i.e. non-dot-)* files within the current directory (non-recursive), simply enter

```bash
bytes
```

in your terminal.

You can also specify a different directory to calculate the file-size total for:

```bash
bytes ~/some/dir
```

If you want to display the result in a different unit (e.g. kilobytes or megabytes), use the [-u](#optionUnit) option to specify the desired unit.

If you want to include *hidden* files, i.e. dot-files, in the total, use the [-a](#optionAll) option.

If you want to include subdirectories into the calculation, use the [-r](#optionRecursive) option.

See the [Options](#options) section for a full list of available options.

#### Options<a name="options"></a>

##### `-a | --all`<a name="optionAll"></a>
Include dot-files a.k.a. hidden files into the total.

##### `-h | --help`<a name="optionHelp"></a>
Display usage information.

##### `-n | --newline`<a name="noNewlineOption"></a>
Do not print a trailing newline character.

##### `-p | --precision <precision>`<a name="optionPrecision"></a>
Specify the desired floating point precision *(default: 3)*.

##### `-r | --recursive`<a name="optionRecursive"></a>
If set, `bytes` recursively traverses subdirectories. *(default: false)*

##### `-u | --unit <b | kb | mb | gb | tb>`<a name="optionUnit"></a>
Use this option to specify the desired unit for the disk space output. Supported units are:

- `b` = bytes *(default)*
- `kb` = kilobytes (1024 bytes)
- `mb` = megabytes (1024 kilobytes)
- `gb` = gigabytes (1024 megabytes)
- `tb` = terabytes (1024 gigabytes)

##### `-v | --version`<a name="versionOption"></a>
Display version information.

*[No IEC support because we <3 binary and 1+1 still equals 10]*

### [CHANGELOG](CHANGELOG.md)

[License](LICENSE)
-------

The MIT License (MIT)

Copyright (c) Hans-Peter Dietz | [@h_p_d](https://twitter.com/h_p_d) | [h.p.dietz@gmail.com](mailto:h.p.dietz@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

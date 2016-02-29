bytes
=====================

#### Retrieves the amount of disk space consumed by files within a directory listing

**bytes** is a simple command line tool to retrieve the size total of files within a directory.

### Installation

Simply execute the installation script via

```bash
./install.sh
```

in order to add the bytes command to your PATH. You may need to restart your Terminal for changes to become effective.

### Usage

To calculate the total number of **bytes** consumed by all *visible (i.e. non-dot-)* files within the current directory, simply enter

```bash
bytes
```

in your terminal.

You can also specify a different directory to calculate the total byte-size for:

```bash
bytes <pathToDirectory>
```

If you are interested in a different unit (e.g. kilobytes or megabytes), use the [-u](#optionUnit) option to specify the desired unit.

If you want to include *hidden* files, i.e. dot-files, to the total, use the [-a](#optionAll) option.

#### Options

##### `-u | --unit <b | kb | mb | gb | tb>`<a name="optionUnit"></a>
Use this option to specify the desired unit for the size output. Supported units are:

- `b` = bytes
- `kb` = kilobytes (1024 bytes)
- `mb` = megabytes (1024 kilobytes)
- `gb` = gigabytes (1024 megabytes)
- `tb` = terabytes (1024 gigabytes)

##### `-a | --all`<a name="optionAll"></a>
Include dot-files a.k.a. hidden files into the total.

### [Release Notes](RELEASE_NOTES.md)

[License](LICENSE)
-------

The MIT License (MIT)

Copyright (c) Hans-Peter Dietz | [@h_p_d](https://twitter.com/h_p_d) | [h.p.dietz@gmail.com](mailto:h.p.dietz@gmail.com)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

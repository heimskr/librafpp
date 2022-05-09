# librafpp

This is a C++ library to print raf to the terminal based on 190n's [libraf](https://github.com/190n/libraf).

## Usage

### `void Raf::raf(bool true_color)`

Print raf to `stdout`

- `true_color`: whether to use true color (otherwise uses ANSI colors)

### `void Raf::raf(FILE *fp, bool true_color)`

Print raf to any file

- `fp`: file to print to
- `true_color`: whether to use true color (otherwise uses ANSI colors)

### `bool Raf::raf(int fd, bool true_color)`

Write raf to any file descriptor

- `fd`: file descriptor to write to
- `true_color`: whether to use true color (otherwise uses ANSI colors)

Returns whether the operation succeeded. If it didn't, `errno` will be set.

## Compiling

Running `make` or `make all` will build everything. There are also individual targets to build
`libraf.so`/`libraf.dylib`, `rafpp.pc`, `raf_test` and `raf_test_shared`.

## Installation

Run `make install` as root. The default prefix is `/usr`. You can select an alternative prefix with
`make PREFIX=<prefix> install`.

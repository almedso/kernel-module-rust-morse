# Rust out-of-tree module


## How to build


Please note that:

- The kernel that the module is built against needs to be Rust-enabled (`CONFIG_RUST=y`).
- The kernel that the module is built against needs to be Modules-enabled (`CONFIG_MODULES=y`).
- The kernel that the module is built against needs to be build with `LLVM=1` llvm toolchain
- The kernel tree (`KDIR`) requires the Rust metadata to be available. These are generated during the kernel build, but may not be available for installed/distributed kernels (the scripts that install/distribute kernel headers etc. for the different package systems and Linux distributions are not updated to take into account Rust support yet).
  - All Rust symbols are `EXPORT_SYMBOL_GPL`.

Build as follow:

```sh
$ make KDIR=.../linux-with-rust-support LLVM=1
make -C .../linux-with-rust-support M=$PWD
```

### rust-analyzer

Rust for Linux (with https://lore.kernel.org/rust-for-linux/20230121052507.885734-1-varmavinaym@gmail.com/ applied) supports building a `rust-project.json` configuration for [`rust-analyzer`](https://rust-analyzer.github.io/), including for out-of-tree modules:

```sh
make -C .../linux-with-rust-support M=$PWD rust-analyzer
```

## Some Remarks and References

- For details about the Rust support, see https://rust-for-linux.com.
- For details about out-of-tree modules, see https://docs.kernel.org/kbuild/modules.html.
- The module is derived from https://github.com/Rust-for-Linux/rust-out-of-tree-module.


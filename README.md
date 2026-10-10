# Australis.Dev-user-demo

A small **terminal input and root-file reading** demonstration for **Australis OS**.

This development application exercises the operating system's user-program runtime beyond printing a fixed message. It is intended as a reference for developers testing interactive console programs and filesystem access.

## Overview

The demo focuses on two user-facing operations:

- **Terminal input:** accept data entered by the user through the Australis terminal.
- **Root-file reading:** request and read a file from the root of the HyFS filesystem.

Together, these demonstrate how an application can communicate with the terminal and access OS-managed resources through the supported Australis executable interface.

This is a **development example**, not a general-purpose file viewer or terminal utility.

## Requirements

- A build of **Australis OS** with the user-program loader, terminal input, and file-reading operations.
- An **Australis-compatible `.exec` build** of the demo.
- A HyFS image containing both the executable and a suitable file for the demo to read.
- The **Hydrogen compiler** with the Australis target, if compiling from Hydrogen source.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Aurora-softwares/Australis.Dev-user-demo.git
cd Australis.Dev-user-demo
```

### 2. Prepare the executable

The repository currently contains documentation and a license; it does **not yet include application source code or a ready-made executable**.

When the source and its Hydrogen project file are available, compile them using a Hydrogen compiler that supports the Australis target. See [Australis-HelloWorld](https://github.com/Aurora-softwares/Australis-HelloWorld) for a working example of the project and build workflow.

### 3. Add the executable to HyFS

For the current read-only HyFS boot image, place the compiled `.exec` file in the `rootfs` directory of the Australis OS build, together with the root-level test file it will read:

```text
Australis-OS/
└── rootfs/
    ├── user_demo.exec
    └── <test-file>
```

Rebuild the OS image so both files are packed into HyFS. The test filename and its contents must match what the demo implementation expects.

### 4. Run in Australis OS

After booting the rebuilt image, invoke the program from the terminal:

```text
run /user_demo.exec
```

The filename above is an example; use the actual name of the generated executable.

Once launched, follow its input prompt (if present) and inspect the reported file data. Exact prompts and output depend on the implementation.

## How It Works

```text
Terminal command
      |
      v
Australis program loader
      |
      v
User demo (.exec)
      |            |
      v            v
Terminal input   HyFS root-file read
      |            |
      +------+-----+
             |
             v
       Demo output
```

The application is intended to use the services offered by the Australis runtime, rather than directly accessing the terminal hardware or filesystem storage.

## What This Tests

- Launching a user application from HyFS.
- Handling interactive terminal input.
- Resolving and reading a root-level file.
- Returning control to the Australis terminal after execution.

For memory-isolation and error-recovery testing, see [Australis.Dev-user-fault](https://github.com/Aurora-softwares/Australis.Dev-user-fault).

## Current Limitations

Australis OS and Hydrogen are under active development. The current HyFS boot image is read-only, and the available executable instructions and operating-system services are still evolving.

This repository currently serves as a placeholder for the test application's own source and build instructions. The documented launch filename is illustrative rather than a verified build artifact.

## Related Projects

- [Australis OS](https://github.com/Aurora-softwares/Australis-OS) — operating system and runtime.
- [Australis-HelloWorld](https://github.com/Aurora-softwares/Australis-HelloWorld) — minimal Hydrogen application and build example.
- [Hydrogen Compiler](https://github.com/Aurora-softwares/Hylang-Compiler) — compiler and Australis backend.
- [Hydrogen website](https://hylang.co.uk/) — language information.

## Contributing

Bug reports, improvements, and contributions are welcome. For issues specific to the kernel or runtime, please use the Australis OS repository; for compiler issues, use the Hydrogen Compiler repository.

## License

See [LICENSE](LICENSE) for this repository's license.

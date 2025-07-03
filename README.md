# pNpm image

[pNpm](https://www.pnpm.io/) is a fast, disk space efficient package manager for node modules.
This image just a wrapper of the official node image with pnpm installed.

## Usage

You can use this image as a base image for your project.  
or you can run it directly to use pnpm.

```bash
docker run --rm -it johnnyworks/pnpm:22.17.0-slim bash
```
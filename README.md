# Network Performance Monitoring lab environment

This repository contains the packer templates, scripts, and files for building the materials for New Relic's Network Performance Monitoring lab.

## Build the Google Cloud image

Build a new image from inside the root directory:

```bash
packer build -force .
```

## Network files

This lab uses _.snmprec_ files to simulate network devices. These files are kept in the _files_ directory and used by cloning and referencing the remote repository. Therefore, when you make changes to the network files, push the changes to the remote repo before rebuilding the image.

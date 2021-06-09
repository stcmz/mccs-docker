# MCCS Docker Image

![build workflow](https://github.com/stcmz/mccs-docker/actions/workflows/build.yml/badge.svg)
![release workflow](https://github.com/stcmz/mccs-docker/actions/workflows/release.yml/badge.svg)

This repository contains the scripts to create Docker images with the MCCS toolchain and all third-party software used in the MCCS protocol installed and configured.


## Disclaimer

To use scripts in this repository to install and configure the included third-party software, one must read and agree their licenses first:

* PROPKA: https://github.com/jensengroup/propka/blob/master/LICENSE
* Open Babel: https://github.com/openbabel/openbabel/blob/master/COPYING
* VEGA CLI: https://www.ddl.unimi.it/vega/
* UCSF Chimera: https://www.cgl.ucsf.edu/chimera/docs/licensing.html


## What's Included

* [MCCS toolchain](https://github.com/stcmz/mccs-toolchain)
  * [gpcrn](https://github.com/stcmz/gpcrn)
  * [mccsx](https://github.com/stcmz/mccsx)
  * [pdbget](https://github.com/stcmz/pdbget)
  * [pdbm](https://github.com/stcmz/pdbm)
  * [pdbqtf](https://github.com/stcmz/pdbqtf)
  * [jdock](https://github.com/stcmz/jdock)
  * [pdbrn](https://github.com/stcmz/pdbrn)
* [PROPKA](https://github.com/jensengroup/propka)
* [Open Babel](https://github.com/openbabel/openbabel)
* [VEGA CLI](https://www.ddl.unimi.it/vega/)
* [UCSF Chimera](https://www.cgl.ucsf.edu/chimera/)
* [Side Chain Fixing Script](https://gist.githubusercontent.com/bougui505/c8599a6659b368c18b45bc321c49a0b1/raw/9af9c7df24f9b5213a5d4362e5f871ce5b51140f/incompleteSideChains.py)


## Platforms

|Folder|Root Image|OS|
|-|-|-|
|[slim](https://github.com/stcmz/mccs-docker/tree/main/slim)|[debian:buster-slim](https://hub.docker.com/_/debian)| Debian GNU/Linux 10, code name Buster|


## How to Build

To build the image, one must first [install Docker](https://docs.docker.com/get-docker/). The Docker Desktop is full-featured with GUI support and runs on Windows and macOS while on Linux platforms the command line Docker Engine is provided.

One can build the Docker image from a command line
```
docker build slim -t mccs
```

It usually takes a few minutes to build, varying by connection speed and computer performance.


## Usage

With the Docker image successfully built, one can start a container with
```
docker run --rm -it -v "$(pwd):/data" mccs
```

The MCCS tools run with molecular models. Via the `-v "$(pwd):/data"` argument, docker maps the current working directory to the `/data` directory in the container. Once the container launched, one can navigate to `/data` and perform the computation.
```
# In the container
cd /data

# Now you can use the tools against the molecular models located in your physical hard drive.
# All MCCS related tools are immediately available and most can be invoked by name, e.g. jdock, mccsx.

# Third-party software are invoked by the following commands.
# Please refer to their official documentation for detailed usage.
propka3
obabel
vega
chimera --nogui

# The side chain fixing script is located at ~/incompleteSideChains.py
```


## Author

[Maozi Chen]


[Maozi Chen]: https://www.linkedin.com/in/maozichen/
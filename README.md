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


## Author

[Maozi Chen]


[Maozi Chen]: https://www.linkedin.com/in/maozichen/
# Peach Fuzzing Platform

This repo is a backup/fork for [Peach Community Edition](https://sourceforge.net/projects/peachfuzz/) (v2.3.9).

* Branch `master` contains initial copy of Sourceforge [files](https://sourceforge.net/projects/peachfuzz/files/Peach/2.3.9/)
* Branch `dev` contains my fixups and additions

This version is adopted to Linux (Ubuntu). This package tested on **Ubuntu 18.04** with **Python 2.7.15rc1**.


## Installation

Python version: **Python 2.7** (not 3!)

It's recommended to work from virtual environment
```
virtualenv -p python2.7 env
source env/bin/activate
```

You can install dependencies using script or manually. All sources are stored in `dependencies/`
```
dependencies/install_deps.sh
```

Now it's ready to work!
```
python peach.py
```

#!/bin/bash

# This is script for dependencies installation.
# "Usage:
#     ./install_deps.sh [-h] [-f]"
#           -f  -- force installation outside virtual env"

if [ "$1" == "-h" ]; then
    echo "Usage: ./install.sh [-h] [-f]"
    echo "    -f  -- force installation outside virtual env"
    exit 0
fi

USE_ENV=1
if [ "$1" == "-f" ]; then
    USE_ENV=0
fi

if [ $USE_ENV -eq 0 ]; then
    # Default python directory
    ENVDIR=/usr/local/lib
    python=/usr/bin/python2.7
else
    if [ -z $VIRTUAL_ENV ]; then
        echo "You are trying to install Peach outside virtual environment!"
        echo "If you REALLY want it, add -f key."
        exit 0
    else
        ENVDIR=$VIRTUAL_ENV
    fi
fi


SCRIPTDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $SCRIPTDIR
DEPDIR=$SCRIPTDIR/dependencies

DEPS=("4Suite-XML-1.0.2" "cDeepCopy" "comtypes-0.6.2" "cPeach"
"Pyrex-0.9.9" "peach-pypcap" "psutil-0.2.0" "pyasn1-0.0.13a"
"PyDbgEng-0.14" "zope.interface-3.6.1" "Twisted-10.2.0")


echo ""
echo "* Install Peach dependencies:"
for DEP in ${DEPS[*]}
do
    echo $DEP
done
echo "* into $ENVDIR"
echo "********************************************"
echo ""


for DEP in ${DEPS[*]}
do
    echo "* Installing $DEP"
    cd $DEP
    rm -rf build dist

    if $DEP=="peach-pypcap"
    then
        python setup.py config
    fi

    python setup.py install --prefix $ENVDIR

    if [ $? -eq 1 ]
    then
        echo "* Installing $DEP failed!"
        exit 1
    fi

    cd ..
    echo "$DEP successfully installed!"
    echo "********************************************"
done

echo ""
echo "* Dependencies successfully installed!"

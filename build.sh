#!/bin/sh

#
# Thicket
# https://github.com/d-plaindoux/thicket
#
# Copyright (c) 2015-2016 Didier Plaindoux
# Licensed under the LGPL2 license.
#

#
# Setup thicket compiler home
#

if [ "x$THICKET_HOME" == "x" ]; then
    echo "THICKET_HOME variable be defined"
    exit 1
fi

THICKET=$THICKET_HOME/bin/thicket
THICKET_SITE=$HOME/.thicket/site

SOURCE=src/main/thicket
NATIVE=src/main/js

#
# Clean binaries
#

rm bin/*
rm obj/*

# 
# Compile main (generic)
#

$THICKET compile `find src/main/thicket -name *.tkt` -v -o obj -i $THICKET_SITE -p ./package.pkt -d

if [ $? -ne 0 ]; then
    exit 1
fi

#
# Make package (generic)
# 

$THICKET package -i obj -i src/main/js -o bin -n -s -v package.pkt

if [ $? -ne 0 ]; then
    exit 1
fi

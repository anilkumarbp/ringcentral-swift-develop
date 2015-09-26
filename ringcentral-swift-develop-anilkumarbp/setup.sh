#!/bin/bash

dir=$(PWD)
dir2=$(PWD)
parentdir="$(dirname "$dir")"

echo "Migrating appropriate files..."

cd lib/
cp -r core ../../
cp -r http ../../
cp -r platform ../../
cp -r subscription ../../

echo "Done!"

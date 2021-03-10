#!/bin/bash

# FUNCTIONS

# open multiple netcdf files at once (requires module ncview to be loaded)
# example usage: nm extra 100 200 20
function nm () {
  ncview $(for n in {$2..$3..$4}; do echo $1_$n.000.nc; done) &
}

# upload a file to the PIK cloud server via curl
# example usage: curltocloud '***' ~/path/to/examplefile (put password in single quotes)
function curltocloud () {
  curl -u "garbe":"$1" -T "$2" "https://cloud.pik-potsdam.de/remote.php/dav/files/garbe/$(basename $2)"
}

# recursively find files (excluding hidden directories and files)
# example usage: findf "*.pdf"
function findf () {
  find -L . -type d -path '*/\.*' -prune -o -not -name '.*' -type f -iname $1 -print
}

# recursively find directories (excluding hidden directories)
# example usage: findd "*historical*"
function findd () {
  find -L . -type d -path '*/\.*' -prune -o -not -name '.*' -type d -iname $1 -print
}


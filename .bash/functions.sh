#!/bin/bash

# FUNCTIONS

# batch rename multiple files using a given pattern
# example usage: rename TEST test TEST*
# will rename files 'TEST1.txt', 'TEST2.txt', ... to 'test1.txt', 'test2.txt', ...
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# NOTE: There's already the 'rename' command doing exactly this!
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#function rename () {
#  expression=$1
#  replacement=$2
#  shift 2 # omit first two parsed arguments when expanding wildcard
#  files=( "$@" )
#  for file in $files; do echo mv $file ${file//$expression/$replacement}; done
#  echo "Are you sure?"
#  select yn in "Yes" "No"; do
#    case $yn in
#      Yes ) for file in $files; do mv $file ${file//$expression/$replacement}; done; break;;
#      No ) return;; # return without closing shell
#    esac
#  done
#}

# open ncview in background
function nv () {
  ncview $1 &
}

# open multiple netcdf files with PISM-like naming pattern in ncview at once
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

# start jupyter notebook on cluster nodes via slurm submission
#TODO: forward file name to submission script
function snb () {
  logfile=~/.jupyter_launch.log
  [ -f $logfile ] && rm -f $logfile # delete old logfile if it exists
  sbatch ~/scripts/Cluster/launch_jupyter_on_cluster.submit # submit job to slurm
  echo -n "Waiting for notebook to start"
  while [ ! -s $logfile ] ; do echo -n "." ; sleep 0.2 ; done # wait for the logfile to appear and be not-empty
  echo ""
  tail -f -n 12 $logfile # show last 12 lines to see full logfile. Change value according to number of printed lines in submission script.
}


#!/bin/bash

inputdir=/home/will/WRF/GFS
rm -rf $inputdir
mkdir $inputdir

year=$1
month=$2
day=$3
runcycle=$4
runlength=$5

for ((i=000; i<=${runlength}; i+=3))
do
    ftime=`printf "%03d\n" "${i}"`

    server=https://nomads.ncep.noaa.gov/pub/data/nccf/com/gfs/prod
    directory=gfs.${year}${month}${day}/${runcycle}
    file=gfs.t${runcycle}z.pgrb2.0p50.f${ftime}

    url=${server}/${directory}/${file}

    echo $url

    wget -O ${inputdir}/${file} ${url}

done

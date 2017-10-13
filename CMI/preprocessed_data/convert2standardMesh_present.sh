#!/bin/bash

module load afni

data_dir=/data/finnes/CMI/preprocessed_data/Movie_Present
fs_dir=/data/finnes/CMI/scripts/freesurfer/
current=`pwd`

cd $data_dir

for aSub in *.results

do

aS=`echo $aSub | sed 's/.results//'`

cd $data_dir/$aSub

SurfToSurf -i_gii /data/finnes/CMI/scripts/freesurfer/$aS/SUMA/std.141.lh.white.gii  -i_gii /data/finnes/CMI/scripts/freesurfer/$aS/SUMA/lh.white.gii -prefix std.141.lh -mapfile /data/finnes/CMI/scripts/freesurfer/$aS/SUMA/std.141.${aS}_lh.niml.M2M -dset errts.${aS}.lh.niml.dset.tproject.niml.dset

SurfToSurf -i_gii /data/finnes/CMI/scripts/freesurfer/$aS/SUMA/std.141.rh.white.gii  -i_gii /data/finnes/CMI/scripts/freesurfer/$aS/SUMA/rh.white.gii -prefix std.141.rh -mapfile /data/finnes/CMI/scripts/freesurfer/$aS/SUMA/std.141.${aS}_rh.niml.M2M -dset errts.${aS}.rh.niml.dset.tproject.niml.dset

cd $current

done

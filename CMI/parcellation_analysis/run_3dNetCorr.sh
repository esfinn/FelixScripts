#!/bin/bash

module load afni
top_dir=/data/finnes/CMI/preprocessed_data/Movie_Present/

for subj in NDARAG340ERT NDARAW179AYF NDARBJ159HXB NDARBU607ZZ3 NDARCK647MU6 NDARCL590LPD NDARCU865PBV NDARCW933FD5 NDARDT528ZZJ NDAREF164ZUJ NDAREY778CR9 NDARFK477WX9 NDARGT551AFK NDARHA387FPM NDARHN158DC6 NDARHZ923PAH NDARJJ413MNH NDARJL303FKR NDARJV268PNW NDARJV377HG4 NDARLR030EW6 NDARMM326JCB NDARMP745EAC NDARMT732GKM NDARMV718DYL NDARMZ687XRR NDARND348HB3 NDARNT541VT2 NDARPC817XZ5 NDARPE056ACA NDARPW635LN4 NDARRB942UWU NDARRG199RU4 NDARRK882CLT NDARRL685WB7 NDARRW940BL6 NDARTU777GVV NDARTW850GHU NDARTW855BPJ NDARTX659HAF NDARTX795AKR NDARUL456EER NDARUT018UYN NDARVT488RXJ NDARVY366HWJ NDARWA351ZE2 NDARWM527PRT NDARWP595TE6 NDARWT449PUN NDARXR637JER NDARYA503XVQ NDARYL758JGG NDARZE850WXD NDARZJ603JM0 NDARZK732FZ0

do

for task in Movie_Present
do

3dNetCorr -prefix /data/finnes/CMI/parcellation_analysis/${subj}.${task}.errts.fanaticor.shen268 \
-inset $top_dir/${subj}.${task}.volResults/errts.${subj}.fanaticor+tlrc.HEAD \
-in_rois /data/finnes/CMI/shen_2mm_268_parcellation_HaskinsPeds+tlrc.HEAD \
-fish_z \
-ts_out

done
done

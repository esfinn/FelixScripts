#!/bin/bash

module load afni

task=Movie_Present
topdir=/data/finnes/CMI/preprocessed_data/$task

# readarray subjlist < subj_list_n76_PresentTRs90pct.txt
# subjlist=`cat subj_list_n76_PresentTRs90pct.txt`
# echo $subjlist

subjlist=(NDARAN814UPR NDARAP176AD1 NDARBF805EHN NDARBR740NKV NDARBX121UM9 NDARBX974XDR NDARCL590LPD NDARCM302VJ1 NDARDL511UND NDAREF893ZM8 NDAREM731BYM NDARFE163HVN NDARFW972KFQ NDARFY009MNL NDARGB441VVD NDARGE536BGD NDARGH775KF5 NDARGL800LDW NDARHA387FPM NDARHR753ZKU NDARHZ923PAH NDARJL303FKR NDARJM828PAL NDARJY033DKZ NDARJZ679KXJ NDARKD134TCX NDARKF909WM5 NDARKG859AGN NDARLF480DMW NDARLH979WFX NDARLL720BGU NDARLR030EW6 NDARMD575AXD NDARMH249AWF NDARMJ219AKU NDARMT064WBB NDARMW178UDD NDARNE758RD6 NDARNR773DL4 NDARNZ615UEU NDARPC817XZ5 NDARPF179GNV NDARPM105MKA NDARPW635LN4 NDARPX219TW0 NDARRB942UWU NDARRF897HB5 NDARRK213WCF NDARRP163YRC NDARRP818DWL NDARRV480PU1 NDARRW100AU0 NDARRW940BL6 NDARRY280KNW NDARTE785ZMJ NDARTW855BPJ NDARTX659HAF NDARUR987CDM NDARUV263YB5 NDARUW816MP3 NDARVV199XK2 NDARWA513WM2 NDARWA622HHZ NDARWJ217HDQ NDARWV405ZW0 NDARWW005GCU NDARXH597ML1 NDARXL588FFJ NDARXR965TFK NDARXX895FNJ NDARYA556KP8 NDARYD195BDH NDARYG874EKA NDARZN277NR6 NDARZP630WYL NDARZY668NMV)

echo -e "Subj\tSubj2\tInputFile" >> data_n76.txt

subjlist_length=${#subjlist[@]}

for i in `seq 1 $subjlist_length`
do

s1=${subjlist[$i-1]}

for j in `seq 1 $subjlist_length`
do

s2=${subjlist[$j-1]}

if (($i<$j))
then

echo Doing ${s1} and ${s2}

filename=/data/finnes/CMI/isc_analysis/pairwise_iscMaps/${s1}_${s2}_${task}.volResults_errts.fanaticor+tlrc.HEAD

# for making input file to 3dLME
echo -e "${s1}\t${s2}\t$filename" >> data_n76.txt

# if [[ -e $filename ]]
# then

# echo ${s1} and ${s2} already exists

# else
# echo 3dTcorrelate -prefix $filename -polort -1 $topdir/${s1}.${task}.volResults/errts.${s1}.fanaticor+tlrc.HEAD $topdir/${s2}.${task}.volResults/errts.${s2}.fanaticor+tlrc.HEAD >> Tcorrelate_pairs_n76.txt

# fi
fi

done
done

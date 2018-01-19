#!/bin/bash

module load afni

task=Movie_Present
topdir=/data/finnes/CMI/preprocessed_data/$task

# readarray subjlist < subj_list_n76_PresentTRs90pct.txt
# subjlist=`cat subj_list_n76_PresentTRs90pct.txt`
# echo $subjlist

subjlist=(NDARAN814UPR NDARAP176AD1 NDARBF805EHN NDARBR740NKV NDARBV680AA8 NDARBX121UM9 NDARBX974XDR NDARCN669XPR NDARDL511UND NDAREF893ZM8 NDAREM731BYM NDARFE163HVN NDARFW972KFQ NDARGE536BGD NDARHM421JUP NDARHR753ZKU NDARHY177LY9 NDARJG488XHT NDARJM828PAL NDARJY033DKZ NDARJZ679KXJ NDARKD134TCX NDARKG859AGN NDARLF480DMW NDARLH979WFX NDARLL720BGU NDARLY585ZVN NDARMD575AXD NDARMH249AWF NDARMJ219AKU NDARMT064WBB NDARMW178UDD NDARNE758RD6 NDARNN218UGY NDARNR773DL4 NDARNZ615UEU NDARPF179GNV NDARPM105MKA NDARPX219TW0 NDARRD326KB9 NDARRF897HB5 NDARRL660CME NDARRP163YRC NDARRP818DWL NDARRV480PU1 NDARRW100AU0 NDARRY280KNW NDARTE785ZMJ NDARTJ032FJ2 NDARTP313AGH NDARUR987CDM NDARUV263YB5 NDARUW816MP3 NDARVD685RRJ NDARVV199XK2 NDARWA513WM2 NDARWA622HHZ NDARWJ217HDQ NDARWV405ZW0 NDARWW005GCU NDARXH597ML1 NDARXR965TFK NDARXX895FNJ NDARXY938XY7 NDARYD195BDH NDARYG874EKA NDARZN277NR6 NDARZY668NMV)

echo -e "Subj\tSubj2\tInputFile" >> data_SRSn68.txt

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
echo -e "${s1}\t${s2}\t$filename" >> data_SRSn57.txt

if [[ -e $filename ]]
then

echo ${s1} and ${s2} already exists

else
3dTcorrelate -prefix $filename -polort -1 $topdir/${s1}.${task}.volResults/errts.${s1}.fanaticor+tlrc.HEAD $topdir/${s2}.${task}.volResults/errts.${s2}.fanaticor+tlrc.HEAD

# echo 3dTcorrelate -prefix $filename -polort -1 $topdir/${s1}.${task}.volResults/errts.${s1}.fanaticor+tlrc.HEAD $topdir/${s2}.${task}.volResults/errts.${s2}.fanaticor+tlrc.HEAD >> Tcorrelate_pairs_n76.txt

fi
fi

done
done

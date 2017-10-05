#!/bin/bash
 
module load afni
 
export AFNI_DETACH=NO
 
for aS in $@
do
        centerC=`3dCM $aS`
 
        afni -com "SWITCH_UNDERLAY ${aS}" \
        -com "OPEN_WINDOW A.axialimage mont=3x3:8 geom=600x600+800+600" \
        -com "OPEN_WINDOW A.sagittalimage" \
        -com "SET_DICOM_XYZ A ${centerC}" \
        -com "SAVE_JPEG A.axialimage ${aS%.nii.gz}_ax.jpg" \
        -com "SAVE_JPEG A.sagittalimage ${aS%.nii.gz}_sag.jpg blowup=3" \
        -com "QUIT"
done
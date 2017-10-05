#!/bin/bash

module load afni
 
export AFNI_DETACH=NO
 
afni -yesplugouts -np 8675 &
 
sleep 15
 
for aS in $@
do
if [ -e ${aS%.nii.gz}_sag.jpg ]; then
    echo "file exists!"
else
        centerC=`3dCM $aS`
 
        plugout_drive -np 8675 \
        -com "SWITCH_UNDERLAY ${aS}" \
        -com "OPEN_WINDOW A.axialimage mont=3x3:8 geom=600x600+800+600" \
        -com "OPEN_WINDOW A.sagittalimage" \
        -com "SET_DICOM_XYZ A ${centerC}" \
        -com "SAVE_JPEG A.axialimage ${aS%.nii.gz}_ax.jpg" \
        -com "SAVE_JPEG A.sagittalimage ${aS%.nii.gz}_sag.jpg blowup=3" \
        -quit
fi

done
 
plugout_drive -np 8675 -com "QUIT"

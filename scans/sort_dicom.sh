for each in /data/finnes/scans/timtriob_20170126_181144104
do
 seriesID=`dicom_hdr ${each} | grep "Series Number" | awk -F"//" '{print $3}'`;
 if [ ! -e /data/finnes/scans/tb4450/SORTED/${seriesID} ]; then
 mkdir -p /data/finnes/scans/tb4450/SORTED/${seriesID};
 echo "Series ${seriesID}"
 fi;
 cp ${each} /data/finnes/scans/tb4450/SORTED/${seriesID};
done
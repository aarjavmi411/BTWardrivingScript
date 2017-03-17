#!/bin/bash
echo "Bluetooth Wardriving"
echo "Usage \. BTWdrivingarg.sh save_directory_path number_of_seconds_scan_should_run "
echo "eg /user/Desktop  and for length of scan any value above 5 for reliable results default is 5"
savedir=$1
lengthofscan=$2
echo "If it gives any error related to rfkill use rfkill unblock all and then try"
hciconfig hci0 up
echo "Bluetooth turned on"
tstamp=$(date +%Y%m%d-%H%M%S)
echo "current time for o/p file noted"
savedir=${savedir:-/root/Desktop}
lengthofscan=${lengthofscan:-5}
echo "save directory is $savedir and scan time is $lengthofscan"
hcitool scan --length=$lengthofscan >>$savedir/bsearch$tstamp.bt
echo "Scan completed moving on to inquiry"
hcitool inq --length=$lengthofscan >> $savedir/bsearch$tstamp.bt
echo "BTSearch cycle complete Here are your Results."
cat $savedir/bsearch$tstamp.bt

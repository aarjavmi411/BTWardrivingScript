#!/bin/bash
#BT scanner
echo "If it gives any error related to rfkill use rfkill unblock all and then continue"
hciconfig hci0 up
echo "Bluetooth turned on"
tstamp=$(date +%Y%m%d-%H%M%S)
echo "current time for o/p file noted"
echo "Enter complete path of Directory where you want to save results.eg /user/Desktop deafult is /root/Desktop"
read savedir
savedir=${savedir:-/root/Desktop}
echo "For how long do you want to run this scan? Enter a value greater than or equal to 5 for reliable results! default is 10"
lengthofscan=10
read lengthofscan
lengthofscan=${lengthofscan:-10}
echo "save directory is $savedir and scan time is $lengthofscan"
hcitool scan --length=$lengthofscan >>$savedir/bsearch$tstamp.bt
echo "Scan completed moving on to inquiry"
hcitool inq --length=$lengthofscan >> $savedir/bsearch$tstamp.bt
echo "BTSearch cycle complete!"
echo "Here are your Results."
cat $savedir/bsearch$tstamp.bt


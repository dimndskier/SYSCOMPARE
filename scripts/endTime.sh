#!/usr/bin/bash -x

# set VARS
source ${APPhome}scripts/ENVIR.sh

# Leave this here at the end of script to determine/capture time during completion of script."
fDATE=`date "+%s" `
echo -e "fDATE:${fDATE}" >> ${APPhome}tallies/eTime
#
# capture fDATE into variable

sTIME=`awk -F: '/sDATE/ { print $2}' ${APPhome}tallies/eTime`
fTIME=`awk -F: '/fDATE/ { print $2}' ${APPhome}tallies/eTime`

echo -en "Start Date/Time:\t";date -d `echo @${sTIME}`
echo -en "Finish Date/Time:\t";date -d `echo @${fTIME}`


#Determine time elapsed from start to completion of script
tTIME=$(( ${fTIME} - ${sTIME}  ))
echo -e "Total Time to Run:\t${tTIME}"


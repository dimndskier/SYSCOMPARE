# Define VARs
#
# tDATE is today's date
tDATE=`date +%Y%m%d`
# yDATE is calculated, as yesterday's date; even over a month change-over
yDATE=$(( ${tDATE} - 1 ))
# APPhome is where this script and any utilities associated are stored
APPhome="/opt/SYSCOMPARE/"
# HOUR of the current time


export tDATE yDATE APPhome

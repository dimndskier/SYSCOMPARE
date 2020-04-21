# Define VARs
#
# tDATE is today's date
tDATE=`date +%Y%m%d`
# yDATE is calculated, as yesterday's date; even over a month change-over
yDATE=$(( ${tDATE} - 1 ))
# APPhome is where this script and any utilities associated are stored
APPhome="/opt/SYSCOMPARE/"
# HOUR of the current time

if [ ! -d "${APPhome}/tallies" ]; then
  mkdir -p "${APPhome}/tallies" && echo "The tallies directory was non-existent, but successfully created."
fi

export tDATE yDATE APPhome

#!/usr/bin/bash

# Define VARs
#
source /opt/SYSCOMPARE/scripts/ENVIR.sh
# Capture date of Start time in EPOCH to determine how long the script ran
sDATE=`date +%s`
echo "sDATE:${sDATE}" > ${APPhome}tallies/eTime


# Define Return Values:
# 130 => Error returned when prior iRPM_List file did not exist

echo -e "Today's Date: ${tDATE}"
echo -e "Yesterday's Date: ${yDATE}"

# Generate a generic list of RPMs currently installed on this system;
#  this generic file will be rolled automatically by logrotate;
#  the file is used to generate other tally files as well.
if [ ! -f "${APPhome}tallies/RPM_List" ]; then
  ${APPhome}scripts/RPMq.dets &
fi

if [ ! -f "${APPhome}tallies/RPM_List-${yDATE}" ]; then
  echo -e "There is no prior RPM_List for comparison; therefore no possible comparison.\nExiting..."
fi

# Generate a generic list of files modified from their original packages
if [ ! -f "${APPhome}tallies/FILES_List" ]; then
  sh ${APPhome}scripts/RPMv.dets &
fi

if [ ! -f "${APPhome}tallies/FILES_List-${yDATE}" ]; then
  echo -e "There is no prior FILES_List for comparison; therefore no possible comparison.\nExiting..."
fi

if [ ! -f "${APPhome}tallies/SHA512sums" ]; then
  sh ${APPhome}scripts/SHAs.dets &
fi

if [ ! -f "${APPhome}tallies/SHA512sums-${yDATE}" ]; then
  echo -e "There is no prior SHA512sums for comparison; therefore no possible comparison.\nExiting..."
fi

if [ ! -f "${APPhome}tallies/AU.conf" ]; then
  ${APPhome}scripts/AU_conf.dets &
fi

if [ ! -f "${APPhome}tallies/AU.conf-${yDATE}" ]; then
  echo -e "There is no prior AU.conf for comparison; therefore no possible comparison.\nExiting..."
fi

if [ ! -f "${APPhome}tallies/AU.rules" ]; then
  ${APPhome}scripts/AU_rules.dets &
fi

if [ ! -f "${APPhome}tallies/AU.rules-${yDATE}" ]; then
  echo -e "There is no prior AU.rules for comparison; therefore no possible comparison.\nExiting..."
fi

if [ ! -f "${APPhome}tallies/AIDE_conf" ]; then
  ${APPhome}scripts/AIDE_conf.dets &
fi

if [ ! -f "${APPhome}tallies/AIDE_conf-${yDATE}" ]; then
  echo -e "There is no prior AIDE_conf for comparison; therefore no possible comparison.\nExiting...\n"
fi

if [ ! -f "${APPhome}tallies/IDENT.pass" ]; then
  ${APPhome}scripts/IDENT.dets &
fi

if [ ! -f "${APPhome}tallies/IDENT.pass-${yDATE}" ]; then
  echo -e "There is no prior IDENT.pass for comparison; therefore no possible comparison.\nExiting...\n"
fi

if [ ! -f "${APPhome}tallies/IDENT.shadow" ]; then
  ${APPhome}scripts/IDENT.dets &
fi

if [ ! -f "${APPhome}tallies/IDENT.shadow-${yDATE}" ]; then
  echo -e "There is no prior IDENT.shadow for comparison; therefore no possible comparison.\nExiting...\n"
fi

if [ ! -f "${APPhome}tallies/IDENT.group" ]; then
  ${APPhome}scripts/IDENT.dets &
fi

if [ ! -f "${APPhome}tallies/IDENT.group-${yDATE}" ]; then
  echo -e "There is no prior IDENT.group for comparison; therefore no possible comparison.\nExiting...\n"
fi

if [ ! -f "${APPhome}tallies/SWAP" ]; then
  ${APPhome}scripts/SWAP.dets &
fi

if [ ! -f "${APPhome}tallies/SWAP-${yDATE}" ]; then
  echo -e "There is no prior SWAP for comparison; therefore no possible comparison.\nExiting...\n"
fi

if [ ! -f "${APPhome}tallies/SVCS" ]; then
  ${APPhome}scripts/SVCS.dets &
fi

if [ ! -f "${APPhome}tallies/SVCS-${yDATE}" ]; then
  echo -e "There is no prior SVCS for comparison; therefore no possible comparison.\nExiting...\n"
fi





sh ${APPhome}scripts/stat.sh &

# Unset tDATE, yDATE and APPhome since they were exported.  No need outside of this script.
unset tDATE yDATE 

${APPhome}scripts/endTime.sh


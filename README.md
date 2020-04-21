# SYSCOMPARE

#### Table of Contents

1. [Overview](#overview)
2. [Script Description - What the module does and why it is useful](#script-description)
3. [Setup - The basics of getting started with SYSCOMPARE](#setup)
    * [What SYSCOMPARE affects](#what-SYSCOMPARE-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with SYSCOMPARE](#beginning-with-SYSCOMPARE)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Overview

This code is meant to generate a report, on any system, upon which it is executed,
to make it easier to compare the same system to itself on a day-by-day basis or
between any two distinct systems.

## Script Description

This project is written entirely in BASH scripting.  The primary script, GEN_tallies.sh,
 is executed by the user directly; which executes other scripts (ending in the extension
 .dets; short for details).

The .dets scripts are aptly named after what they are collecting, such as:
* List of RPMs (rpm -qa)	_Already Addressed_
* Changes to files delivered by RPM installation (rpm -Va) _Already Addressed_
* SWAP Configurations (free -m)
* Service Statuses:
	* systemd services
	* xinetd/sysv services
* File Systems Mounted and with what options
* /etc/passwd File
* /etc/shadow File
* /etc/group File
* McAfee versions:
	* Engine version
	* DAT version
* AUDITD Configurations		_Already Addressed_
	* auditd.conf		_Already Addressed_
	* audit.rules		_Already Addressed_


## Setup

### What SYSCOMPARE affects

* This application will not impact the baseline of your system; however, it 
  could potentially consume storage if unchecked for too long.  The script will
  be configured to keep files under control with the use of logrotate.

### Setup Requirements **OPTIONAL**

Predominantly, this application should reside under the /opt directory or filesystem,
the logrotate policy will be copied into /etc/logrotate.d as 'SYSCOMPARE.'  If the
application IS INSTALLED into a different path then alter the variable "${APPhome}"
within the scripts/ENVIR.sh script.

### Beginning with SYSCOMPARE

To execute the application as intended, execute GEN_tallies.sh.

## Limitations

This script should be compatible with any RHEL variant because it relies on the 
command 'rpm.'  It is not intended for any other OS at this time.

## Development

If you want to contribute to this project, please ensure that the scripts are OS-aware
and do your best not to change too much else.

## ChangeLog -documented from newest on top, down to oldest.

mm/dd/yyyy -__Rev-Maj.Min__        -Author;
	> <description of changes>

04/20/2020      -__SYSCOMPARE-0.1.3__	`Issues={}`      -WFrench;

	> Update the AIDE.dets to check for the aide.conf file, and if not there indicate as such.
	> Added IDENT.dets to grab details about /etc/{passwd,shadow,group}.

04/18/2020      -__SYSCOMPARE-0.1.2__	`Issues={}`      -WFrench;

	> Set the ownership of all files to root:root for proper execution.
	> Set the mode of the SYSCOMPARE logrotate policy to 0640.

04/10/2020      -__SYSCOMPARE-0.1.1__	`Issues={}`      -WFrench;

	> Initial loadup of project, more work will be required before being released.


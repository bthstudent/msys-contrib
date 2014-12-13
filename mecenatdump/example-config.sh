#!/bin/bash
# Mecenatdump - A script to dump membershipinfo to the Mecenat FTP-server
#
# (CC0) No Rights Reserved,
# 2014 Niclas Björner <niclas@cromigon.se>
#
# For details regarding CC0, please read the LICENSE file

# Member section
member_url=""
member_usr=""
member_key=""
member_cmd_url="$member_url/api.php?usr=$member_usr&key=$member_key&cmd=getMembers"

# FTP Section
ftp_host=""
ftp_usr=""
ftp_pass=""

# Mecenat Section
# Note that the mecenatid is the Mecenat id followed by an tailing underscore
mecenatid=""

# Format string appending
free1="www.bthstudent.se"
free2=""
free3=""
section=""

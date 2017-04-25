#!/bin/bash
# Mecenatdump - A script to dump membershipinfo to Mecenats FTP-server
#
# (CC0) No Rights Reserved,
# 2014 Niclas Björner <niclas@cromigon.se>
#
# For details regarding CC0, please read the LICENSE file

# shellcheck source=example-config.sh
source ./local-config.sh

# If current month is in second half of the year the current semester
# is autumn.
# VT for spring semester, HT for autumn.
termin="VT$(date +%y)"
if (( $(date +%m) > 6 )) ; then
    termin="HT$(date +%y)"
fi
# Calculate the filename for the mecenat upload
mecenat_file="$mecenatid$(date +%y%m%d)_mecenat_$(date +%H%M%S)_$termin.txt"

# Format file and push to FTP server.
curl "$member_cmd_url" 2>/dev/null | awk -F ',' '{print $1 ";" $2 ";" $3 ";" $5 ";" $6 ";" $7 ";" $8 ";;" $4 ";;$free1;$free2;$free3;$section;1;1;1;0"}' >> "$mecenat_file"

curl -T "$mecenat_file" ftp://"$ftp_host" --user "$ftp_usr:$ftp_pass"

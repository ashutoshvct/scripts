#!/bin/bash
#Written by Ashutosh.
#Date: 11th Sep, 2018.

cron_file='/tmp/test.txt';
comment_search=$(grep -E '#.*fe_instance_list_new' "$cron_file");
cron_search=`grep "fe_instance_list_new" "$cron_file"`;
echo -e "\n[INFO]: Your crontab file name is: $cron_file"

if [ "$comment_search" == "$cron_search" ]; then
echo -e "[INFO]: cron is already commented. \n[INFO]: See the output below:\n";
echo -e "$cron_search\n";
exit 0;
else
echo "[INFO]: Commenting the Cron line..." 
sed -i /fe_instance_list_new.sh/s/^/#/ "$cron_file"
  if [ $? == 0 ]; then
    echo -e "[INFO]: Done. \n[INFO]: See the output below:\n"
    grep "fe_instance_list_new" "$cron_file"
    echo -e "\n"
    exit 0;
  else
    echo -e "[ERROR]: Re-Run the script or check the above issue.\n"
    exit 1;
  fi
fi
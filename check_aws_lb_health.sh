#!/bin/bash

source_file="$1"

if [[ -z "${source_file}" ]]; then
echo "Run again the script using a txt file as argument."

else 

while read line;
do
#command="aws elb describe-instance-health --load-balancer-name $line"

echo "Load Balancer: $line"
aws elb describe-instance-health --load-balancer-name $line

done < $source_file

fi

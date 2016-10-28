#!/bin/bash

USERNAME=ec2-user

for INSTANCE_IP in $(cat ip_prod.txt)
do
    # print the instance id
    ssh $USERNAME@$INSTANCE_IP "curl -s http://169.254.169.254/latest/meta-data/instance-id"
    # print the contents of /etc/system-release
    ssh $USERNAME@$INSTANCE_IP "cat /etc/system-release"
done

exit 0

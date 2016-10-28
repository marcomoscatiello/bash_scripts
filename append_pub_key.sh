#!/bin/bash
# This is a script to append the public key of a user, in this case krzystof, on a remote server. 
# You can run this local script on a remote machine with the following command: 
# ssh ec2-user@10.249.104.198 'cat | bash /dev/stdin'  < test.sh
# Or in a list of servers using:     for i in `cat krystoflist.txt` ; do  `ssh ec2-user@$i 'cat | bash /dev/stdin'  < test.sh`  ; done


sudo -i

USER_NAME="jacksandall"
HOME_DIR="/home"

USER_PUB_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAj8WbBVBspSBf7nyLVfNkugmRkwTWQpgDwHmdO4BdIEJpF8iqbwLVG9FWX+RqtYmBU4BPK4/bSFkRH4cLoEyuUBzwcb9SZkCpcu8Qa9rwiaWBHFRHWLm8SGEXdB/rPlQApBMZZKmLuqCSbh9p1Us91iZ2OjZ0/E+L2l3PqSxCUgaZRoHy41dmVE/3ZuVMoU85H7SsNWyrRA3zynEZ/IBJTIAh2GhfjyvY8q0zl25pGdYo9Pk3CdGEO8Tir3/VfO5p+AAd7uPcSuLClRWGqtHr4pSJmfuI7eGYQGNFtOtl5OKJGAiZsapDD3wgY0/gGjzygUtj20j6rvMgRKazklNKew=="

rm -f $HOME_DIR/$USER_NAME/.ssh/authorized_keys
echo $USER_PUB_KEY >> $HOME_DIR/$USER_NAME/.ssh/authorized_keys
echo "public key for $USER_NAME added"
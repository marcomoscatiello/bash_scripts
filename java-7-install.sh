#!/bin/bash

cd /tmp/

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn/java/jdk/7u71-b14/jdk-7u71-linux-x64.rpm"
sudo yum install -y jdk-7u71-linux-x64.rpm

#sudo sed -i 's/1.8/default/g' /usr/share/tomcat/bin/setenv.sh

wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jce/7/jce_policy-7.zip"
unzip jce_policy-7.zip
sudo cp UnlimitedJCEPolicyJDK8/*.jar /usr/java/jdk1.7.0_71/jre/lib/security/
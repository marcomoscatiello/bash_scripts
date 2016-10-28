#!/bin/sh

#  addline.sh
#
#
#  Created by Marco Moscatiello on 27/09/2016.
#

sudo -i

echo "which environment? {dev, dev1, dev2, dev3, dev4, int}"

dev_var="dev"
echo "this is the environment selected: "$dev_var
dest_file=/usr/share/tomcat7/conf/application-$dev_var.properties

if [ -f "/usr/share/tomcat7/conf/application-$dev_var.properties" ]
then
echo "File exists"

echo "Line will be appended...."
if ["$dev_var"=dev] ; then
    #echo "configurationBean.loyaltyServer=http://loyalty.intwowcher.co.uk/loyalty-api" >> $dest_file
     echo "contentServices.url=http://content-services.devwowcher.co.uk:9000" >> $dest_file
     echo "DONE"
     # service tomcat restart

elif ["$dev_var"=dev1] ; then 
#    echo "configurationBean.loyaltyServer=http://loyalty01.devwowcher.co.uk/loyalty-api" >> $dest_file
     echo "contentServices.url=http://content-services-01.devwowcher.co.uk:9000" >> $dest_file
     echo "DONE"
   # service tomcat restart

elif ["$dev_var"=dev2] ; then
#    echo "configurationBean.loyaltyServer=http://loyalty02.devwowcher.co.uk/loyalty-api" >> $dest_file
     echo "contentServices.url=http://content-services-02.devwowcher.co.uk:9000" >> $dest_file
     echo "DONE"
   # service tomcat restart

elif ["$dev_var"=dev3] ; then
#    echo "configurationBean.loyaltyServer=http://loyalty03.devwowcher.co.uk/loyalty-api" >> $dest_file
     echo "contentServices.url=http://content-services-03.devwowcher.co.uk:9000" >> $dest_file
     echo "DONE"
    # service tomcat restart

elif ["$dev_var"=dev4] ; then
#    echo "configurationBean.loyaltyServer=http://loyalty04.devwowcher.co.uk/loyalty-api" >> $dest_file
     echo "contentServices.url=http://content-services-04.devwowcher.co.uk:9000" >> $dest_file

# service tomcat restart

#elif ["$dev_var"=int] ; then
#    echo "configurationBean.loyaltyServer=http://loyalty.intwowcher.co.uk/loyalty-api" >> $dest_file

else
     echo "File does not exists... Exiting."
fi

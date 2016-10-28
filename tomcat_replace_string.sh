#!/bin/bash
#this script replace some strings in the tomcat configuration files, based on th type of environment.
#Created by Marco Moscatiello

sudo -i
ENV='dev1'
FILE='/usr/share/tomcat/conf/application-dev1.properties'
FILE2='/usr/share/tomcat7/conf/application-dev1.properties'
FILE3='/etc/environment'
FILE4='/usr/share/tomcat8/conf/application-dev1.properties'

if [ -f "$FILE" ] ; then
echo "File $FILE exists ! Applying change... username renamed"
sed -i.bak s/dd1fyk4tw3w8ivh/$ENV-wow-oracle-dailydeals-anon-db/g $FILE
sed -i.bak s/ORCL/ANONDB/g $FILE
rm $FILE.bak
else echo "File $FILE not existing. Operation skipped."
fi

if [ -f "$FILE2" ] ; then
echo "File $FILE2 exists ! Applying change... username renamed"
sed -i.bak s/dd1fyk4tw3w8ivh/$ENV-wow-oracle-dailydeals-anon-db/g $FILE2
sed -i.bak s/ORCL/ANONDB/g $FILE2
rm $FILE2.bak
else echo "File $FILE2 not existing. Operation skipped."
fi

if [ -f "$FILE3" ] ; then
echo "File $FILE3 exists ! Applying change...db url renamed"
sed -i.bak s/dd1fyk4tw3w8ivh/$ENV-wow-oracle-dailydeals-anon-db/g $FILE3
sed -i.bak s/ORCL/ANONDB/g $FILE3
rm $FILE3.bak
else echo "File $FILE3 not existing. Operation skipped."
fi

if [ -f "$FILE4" ] ; then
echo "File $FILE4 exists ! Applying change... username renamed"
sed -i.bak s/dd1fyk4tw3w8ivh/$ENV-wow-oracle-dailydeals-anon-db/g $FILE4
sed -i.bak s/ORCL/ANONDB/g $FILE4
rm $FILE4.bak
else echo "File $FILE4 not existing. Operation skipped."
fi

echo "Restarting tomcat..."
service tomcat restart
service tomcat7 restart
service tomcat8 restart

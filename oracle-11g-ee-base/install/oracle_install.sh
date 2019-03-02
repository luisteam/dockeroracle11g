#!/bin/bash

set -e

#Delete limits cause of docker limits issue
cat /etc/security/limits.conf | grep -v oracle | tee /etc/security/limits.conf

echo 'Unzipping'
unzip -q database/linux.x64_11gR2_database_1of2.zip
unzip -q database/linux.x64_11gR2_database_2of2.zip
rm -f linux*.zip

mv database /home/oracle/

su oracle -c 'cd /home/oracle/database && ./runInstaller -ignorePrereq -ignoreSysPrereqs -silent -responseFile /install/oracle-11g-ee.rsp -waitForCompletion 2>&1'
rm -rf /home/oracle/database

mv /u01/app/oracle/product /u01/app/oracle-product

#/u01/app/oraInventory/orainstRoot.sh
#/u01/app/oracle/product/11.2.0/EE/root.sh


#$ORACLE_HOME/bin/dbca -silent -createDatabase -templateName General_Purpose.dbc -gdbname EE.oracle.docker -sid EE -responseFile NO_VALUE -totalMemory 2048 -emConfiguration LOCAL  -sysPassword oracle -systemPassword oracle -dbsnmpPassword oracle

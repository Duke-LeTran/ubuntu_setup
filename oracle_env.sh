# Duke's full Oracle 19.3c client env script 
# Date: 2021-10-20
# https://docs.oracle.com/en/database/oracle/oracle-database/18/spucd/step-2-set-operating-system-environment-variables.html#GUID-ED528602-A8AC-4FCC-AA55-A36277A66A23
# https://docs.oracle.com/en/database/oracle/oracle-database/19/lacli/arm-variables-instant-client.html#GUID-7E7ADFBD-510B-4045-945D-CF6AA0044B52
# https://docs.oracle.com/en/database/oracle/oracle-database/19/lacli/relinking-database-client-binaries.html#GUID-74C21B03-0F82-4D89-95E2-A2FA206012B4


echo '' >> ~/.bashrc # add a new line
echo '# Oracle Environmental Variables' >> ~/.bashrc
echo '#----------------------------------' >> ~/.bashrc
echo 'export ORACLE_BASE="/opt/oracle"' >> ~/.bashrc
if # echo 'export ORACLE_HOME="/opt/oracle/instantclient_19_6"' >> ~/.bashrc
echo 'export ORACLE_HOME="/opt/oracle/clarity_193000_client_home"' >> ~/.bashrc
if [ -f "$ORACLE_HOME/libclntsh.so" ]; then #if instant_client_19_x
	echo 'export LD_LIBRARY_PATH="$ORACLE_HOME:$LD_LIBRARY_PATH"' >> ~/.bashrc 
elif [ -f "$ORACLE_HOME/lib/libclntsh.so" ]; then # if full oracle client
	echo 'export LD_LIBRARY_PATH="$ORACLE_HOME/lib:$LD_LIBRARY_PATH"' >> ~/.bashrc
else
	echo "LD_LIBRARY_PATH not found. Please manually set-up this env variable"
fi
echo 'export TNS_ADMIN="$ORACLE_HOME/network/admin"' >> ~/.bashrc
echo 'export PATH="$ORACLE_HOME/bin:/opt/bin:$PATH"' >> ~/.bashrc

echo "Finished install your Oracle environmental variables! Check your .bashrc file to confirm."

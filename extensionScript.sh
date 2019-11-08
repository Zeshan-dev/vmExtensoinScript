#!/bin/sh

connString=${1}
dbName=$(echo $connString | cut -d'/' -f 4 | cut -d'?' -f 1)

sed -i '/COSMOS_CONN/d' /etc/profile
sed -i '/COSMOS_DB/d' /etc/profile

echo "export COSMOS_CONN=$connString" >> /etc/profile
echo "export COSMOS_DB=$dbName" >> /etc/profile

# copy required collections to the database

cd /numtraPlatform/numtraplatformv2/libraryPackages

wget "https://numtrastorage.blob.core.windows.net/backendfiles/NumtraBackend-v2_1.6.0_Dev_deployment-py3.6.egg?st=2019-11-07T10%3A25%3A00Z&se=2019-12-09T10%3A25%3A00Z&sp=rl&sv=2018-03-28&sr=b&sig=D77Pa8b%2BQk4%2FKaEjnu2U93i9Vw3wmH5MVgzCtIkZ934%3D" -k -O NumtraBackend.egg
wget "https://numtrastorage.blob.core.windows.net/backendfiles/TPOT_1.4.DepDev-0.10.1-py3.6.egg?st=2019-11-07T10%3A29%3A00Z&se=2019-12-09T10%3A29%3A00Z&sp=rl&sv=2018-03-28&sr=b&sig=afO%2Be7zcuRBSWxH5PldvE219rMSfeu0I5uAgJVEOgxs%3D" -k -O TPOT.egg

# curl https://raw.githubusercontent.com/Zeshan-dev/vmExtensoinScript/master/MongoCollections/components.json# >> components.json
# curl https://raw.githubusercontent.com/Zeshan-dev/vmExtensoinScript/master/MongoCollections/credentialprofiletypes.json# >> credentialprofiletypes.json
# curl https://raw.githubusercontent.com/Zeshan-dev/vmExtensoinScript/master/MongoCollections/resources.json# >> resources.json
# curl https://raw.githubusercontent.com/Zeshan-dev/vmExtensoinScript/master/MongoCollections/sections.json# >> sections.json

# mongoimport --uri=$connString --collection=credentialprofiletypes --drop --file=credentialprofiletypes.json
# mongoimport --uri=$connString --collection=components --drop --file=components.json
# mongoimport --uri=$connString --collection=resources --drop --file=resources.json
# mongoimport --uri=$connString --collection=sections --drop --file=sections.json
#!/bin/sh

connString=${1}
dbName=$(echo $connString | cut -d'/' -f 4 | cut -d'?' -f 1)

sed -i '/COSMOS_CONN/d' /etc/profile
sed -i '/COSMOS_DB/d' /etc/profile

echo "export COSMOS_CONN=$connString" >> /etc/profile
echo "export COSMOS_DB=$dbName" >> /etc/profile

# copy required collections to the database

cd /numtraPlatform/mongoCollections

curl https://raw.githubusercontent.com/Zeshan-dev/vmExtensoinScript/master/MongoCollections/components.json# >> components.json
curl https://raw.githubusercontent.com/Zeshan-dev/vmExtensoinScript/master/MongoCollections/credentialprofiletypes.json# >> credentialprofiletypes.json
curl https://raw.githubusercontent.com/Zeshan-dev/vmExtensoinScript/master/MongoCollections/resources.json# >> resources.json
curl https://raw.githubusercontent.com/Zeshan-dev/vmExtensoinScript/master/MongoCollections/sections.json# >> sections.json

mongoimport --uri=$connString --collection=credentialprofiletypes --drop --file=credentialprofiletypes.json
mongoimport --uri=$connString --collection=components --drop --file=components.json
mongoimport --uri=$connString --collection=resources --drop --file=resources.json
mongoimport --uri=$connString --collection=sections --drop --file=sections.json
#!/bin/sh

connString=${1}
dbName=$(echo $connString | cut -d'/' -f 4 | cut -d'?' -f 1)

sed -i '/COSMOS_CONN/d' /etc/profile
sed -i '/COSMOS_DB/d' /etc/profile

echo "export COSMOS_CONN=$connString" >> /etc/profile
echo "export COSMOS_DB=$dbName" >> /etc/profile
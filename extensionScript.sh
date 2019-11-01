#!/bin/sh

connString=${1}
dbName=${2}

sed -i '/COSMOS_CONN/d' /etc/profile
sed -i '/COSMOS_DB/d' /etc/profile

echo "export COSMOS_CONN=$connString" >> /etc/profile
echo "export COSMOS_DB=$dbName" >> /etc/profile
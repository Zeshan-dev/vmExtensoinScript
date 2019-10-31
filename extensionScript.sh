#!/bin/sh

sed -i '/COSMOS_CONN/d' /etc/profile
sed -i '/COSMOS_DB/d' /etc/profile

echo "export COSMOS_CONN=$1" >> /etc/profile
#!/bin/sh

mlflowWorkspaceName=${1}
storageAccountUri=${2}
storageAccountSas=${3}

sed -i '/mlflow_workspace/d' /etc/profile
sed -i '/mongoStorageUri/d' /etc/profile
sed -i '/mongoStorageSas/d' /etc/profile

echo "export mlflow_workspace=$mlflowWorkspaceName" >> /etc/profile
echo "export mongoStorageUri=$storageAccountUri" >> /etc/profile
echo "export mongoStorageSas=\"$storageAccountSas\"" >> /etc/profile

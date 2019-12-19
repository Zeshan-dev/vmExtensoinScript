#!/bin/sh

mlflowWorkspaceName=${1}
storageAccountUri=${2}
storageAccountSas="${3}"

sed -i '/mlflowWorkspaceName/d' /etc/profile
sed -i '/mlflow_workspace/d' /etc/profile
sed -i '/mongoStorageUri/d' /etc/profile
sed -i '/mongoStorageSas/d' /etc/profile

echo "export mlflow_workspace=$mlflowWorkspaceName" >> /etc/profile
echo "export MLFLOWWORKSPACE=$mlflowWorkspaceName" >> /etc/profile
echo "export mongoStorageUri=$storageAccountUri" >> /etc/profile
echo "export mongoStorageSas=\"$storageAccountSas\"" >> /etc/profile
echo "export STORAGESAS=\"$storageAccountSas\"" >> /etc/profile

cd /numtraPlatform/numtraplatformv2/libraryPackages

wget "https://numtrastorage.blob.core.windows.net/backendfiles/NumtraBackend-v2_1.2.1_Dev_Changes-py3.6.egg?st=2019-12-09T12%3A54%3A00Z&se=2020-03-12T12%3A54%3A00Z&sp=rl&sv=2018-03-28&sr=b&sig=EDQHHXP0lQ4OEgX%2FaJ4yww3D2fn2IJ04RbagRRWQ%2BgU%3D" -k -O NumtraBackend.egg
wget "https://numtrastorage.blob.core.windows.net/backendfiles/TPOT-0.11.0.Numtra_Dev.0.1-py3.6.egg?st=2019-12-09T12%3A56%3A00Z&se=2020-03-12T12%3A56%3A00Z&sp=rl&sv=2018-03-28&sr=b&sig=qz1ovN8pQE8sJe1qTO4hMHOr5cBTp6ogCgQOiOIYKE4%3D" -k -O TPOT.egg


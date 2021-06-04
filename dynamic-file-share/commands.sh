# src: https://docs.microsoft.com/en-us/azure/aks/azure-files-dynamic-pv

kubectl apply -f azure-file-sc.yaml
kubectl apply -f azure-file-pvc.yaml

# Once completed, the Azure File Share will be created (view it in the portal). 

# A Kubernetes secret is also created that includes connection information 
# and credentials.
kubectl get secrets
kubectl get secret <azure-storage-account-name-secret> -o yaml

kubectl apply -f azure-pvc-files.yaml

# test access to File Share from the Pod:
kubectl exec pod/nginx -it -- /bin/sh
# From inside the Pod shell:
# ls /mnt/azure
# echo "Hello from Azure File Share" > /mnt/azure/myfile.txt
# ls /mnt/azure
# cat /mnt/azure/myfile.txt

# You can also check the File Share in the newly created Storage Account
# from the Azure Portal.

# options for mounting File Share: 
# https://github.com/kubernetes-sigs/azurefile-csi-driver/blob/master/docs/driver-parameters.md#dynamic-provision
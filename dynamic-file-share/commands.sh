# src: https://docs.microsoft.com/en-us/azure/aks/azure-files-dynamic-pv

# Deploy the Storage Class and PVC to create the Storage Account & File Share
kubectl apply -f azure-file-sc.yaml
kubectl apply -f azure-file-pvc.yaml

# The Azure File Share will be created (view it in the portal). 

# A Kubernetes secret is also created that includes Storage Account Key.
kubectl get secrets
kubectl get secret <azure-storage-account-name-secret> -o yaml

# Deploy sample Nginx Pod and attach it to the File Share
kubectl apply -f app-pod.yaml

# Test access to File Share from the Pod:
kubectl exec pod/nginx -it -- /bin/sh
# From inside the Pod shell:
# ls /mnt/azure
# echo "Hello from Azure File Share" > /mnt/azure/myfile.txt
# ls /mnt/azure
# cat /mnt/azure/myfile.txt

# More options for mounting File Share: 
# https://github.com/kubernetes-sigs/azurefile-csi-driver/blob/master/docs/driver-parameters.md#dynamic-provision
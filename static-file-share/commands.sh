# src: https://docs.microsoft.com/en-us/azure/aks/azure-files-volume

# 1) Create Fileshare on Azure Storage Account

# 2) Save the Storage Account Key to a Kubernetes Secret
kubectl create secret generic azure-secret 
        --from-literal=azurestorageaccountname=aksstoragefileshare01 
        --from-literal=azurestorageaccountkey=EyoXBFMd7dqta+LyaKKqvFjaq8P8eI9Y5LoZn1RbvqCf/n/DPfLjdNCYIBmITdx3Jx4OgO1eWuRkrqLv4s9QGQ==

# 3) Deploy the PV, PVC and sample Pod:
kubectl apply -f .
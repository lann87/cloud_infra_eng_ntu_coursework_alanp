# Cloud Engineering Course - NTU SCTP  
### 10/08/2024 - Classroom  

## Kubernetes foundation and deployment  

### Single pod simple k8s  

```sh
apiVersion: v1
kind: Pod
metadata:
  name: alanp-nginx-pod
spec:
  containers:
  - name: alanp-nginx-pod
    image: nginx:latest
    ports:
    - containerPort: 80
```
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/classroom_f2f/k8s_aug10/singlepod_simple_k8s.png)

### Dual pod deployment k8s  

```sh
apiVersion: apps/v1
kind: Deployment
metadata:
  name: alanp-2rep-nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: alanp-2rep-nginx-deployment
        image: nginx:latest
        ports:
        - containerPort: 80
```

![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/classroom_f2f/k8s_aug10/2pod_deployment_k8s.png)

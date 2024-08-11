# Cloud Engineering Course - NTU SCTP  
### Alan 10/08/2024 - Classroom  

## Kubernetes foundation and deployment  
In this class we were taught foundation of how a kubernetes cluster works, the best practices on kubernetes deployment in the industry, understood the yaml format for k8s, and a deployment of a 2 pod desired state k8s.  

**Components of a k8s cluster**  
1.  Control Plane: Main node that does decision making for the cluster such as scheduling of task, performance/capacity scaling, and maintaining the cluster in a desired state.  
The plane consist of these components, Kubernetes API server, scheduler, controller manager, and etcd(/etc = config data, d = distributed system).  

2.  Nodes: Nodes or Worker Nodes in the cluster where applications in containerized pods run, each node has a kubelet which serves as a communication and management agent for the container.


### Single pod simple k8s  

```sh
apiVersion: v1 # Specifies the k8s API ver
kind: Pod # Defines resource type as "Pod"
metadata: # Metadata for the pod
  name: alanp-nginx-pod
spec: # Describes the desired state of the pod
  containers: # Single container using nginx latest image
  - name: alanp-nginx-pod
    image: nginx:latest
    ports:
    - containerPort: 80 # Container listen in on this port
```
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/classroom_f2f/k8s_aug10/singlepod_simple_k8s.png)

### Dual pod deployment k8s  

```sh
apiVersion: apps/v1 # Specifies the k8s API verson
kind: Deployment # Defines resource type as "Deployment"
metadata: # Contain metadata for the deployment
  name: alanp-2rep-nginx-deployment
spec: # Describe the desired state of the deployment
  selector: 
    matchLabels:
      app: nginx
  replicas: 2 # tells deployment to run 2 pods matching the template
  template: # The template for each pods
    metadata: 
      labels:
        app: nginx
    spec:
      containers: # Container name and using which image.
      - name: alanp-2rep-nginx-deployment
        image: nginx:latest
        ports:
        - containerPort: 80
```

![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/classroom_f2f/k8s_aug10/2pod_deployment_k8s.png)

![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)   
# Level 7 Access in Kubernetes Cluster Tutorial  
This guide provides a comprehensive approach to achieving Level 7 access in a Kubernetes (K8s) cluster. Each step is documented to help you understand what you are doing and why it is necessary. Follow the steps below to set up your environment, create deployments, services, and configure ingress and gateways.   


## 1. Login to the Cluster  
To access your Amazon EKS (Elastic Kubernetes Service) cluster, you need to update your kubeconfig file. This file contains the configuration needed for kubectl to communicate with your cluster.  

### Command:  

```sh  
aws eks update-kubeconfig --name <clustername> --region <region>
```  

For cohort 7:   
```sh   
aws eks update-kubeconfig --name CE7-test --region us-east-1
```  
### Understanding:
-  <clustername>: The name of your EKS cluster.  
-  <region>: The AWS region where your cluster is located.  
-  This command configures 3.3. your local kubectl to use the specified EKS cluster, allowing you to manage it using Kubernetes commands.  


## 2. Create Deployments and Services  
You will create two applications, each with a deployment and a service. Deployments manage the application instances, while services expose these instances to network traffic.  

### App1.yaml   
This file defines a service and a deployment for the first application.   

```yaml
apiVersion: v1
kind: Service
metadata:
  name: <NAME>-flask
spec:
  selector:
    app: <NAME>-flask
  ports:
    - port: 80
      targetPort: 8000
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: <NAME>-flask
spec:
  replicas: 1
  selector:
    matchLabels:
      app: <NAME>-flask
  template:
    metadata:
      labels:
        app: <NAME>-flask
    spec:
      containers:
        - name: <NAME>-flask
          image: public.ecr.aws/<your docker app url>V1
          ports:
            - containerPort: 8000
```   

### App2.yaml   
This file defines a service and a deployment for the second application.   

```yaml
apiVersion: v1
kind: Service
metadata:
  name: <NAME>-world-flask
spec:
  selector:
    app: <NAME>-world-flask
  ports:
    - port: 80
      targetPort: 8000
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: <NAME>-world-flask
spec:
  replicas: 1
  selector:
    matchLabels:
      app: <NAME>-world-flask
  template:
    metadata:
      labels:
        app: <NAME>-world-flask
    spec:
      containers:
        - name: <NAME>-world-flask
          image: public.ecr.aws/<your docker app url>V2
          ports:
            - containerPort: 8000
```   

### Apply the YAML Files:
```sh
kubectl apply -f App1.yaml
kubectl apply -f App2.yaml
```
### Understanding:   
-  Service: Defines how to access the application, routing traffic to the pods based on labels.   
-  Deployment: Manages the pods for the application, ensuring the desired number of replicas are running.   
-  <NAME>: Replace with your application name.   
-  <your docker app url>: Replace with the URL of your Docker image in ECR (Elastic Container Registry).   


## 3. Configure Ingress   
Ingress allows you to manage external access to your services, providing HTTP and HTTPS routing to services based on defined rules.   

### Check available ingress classes:   
```sh
kubectl get ingressclass
```

### Create an ingress resource:  
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: <name this yourself>-ingress
  namespace: default
spec:
  ingressClassName: cilium
  rules:
    - host: "provisioned-elb.us-east-1.elb.amazonaws.com"
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: hello-<NAME>
                port:
                  number: 80
```  

### Apply the ingress config:
```sh
kubectl apply -f <your-ingress-file>.yaml
```   

### Understanding:  
-   Ingress Class: Specifies which ingress controller should implement the rules.  
-   Rules: Define how to route incoming requests to the services based on the host and path.  
-   provisioned-elb.us-east-1.elb.amazonaws.com: Replace with the actual ELB (Elastic Load Balancer) URL assigned to your ingress.  

## 4. Explore Gateway Configuration  
Gateways provide a way to manage traffic routing at a higher level than ingress, allowing for more complex routing scenarios.  

### Check available gateway classes:
```sh
kubectl get gatewayclass
```  

### List all networking Custom Resource Definition (CRDs):  
```sh
kubectl get CRD
``` 
### Create a Gateway YAML file:   
```yaml
apiVersion: gateway.networking.k8s.io/v1
kind: Gateway
metadata:
  name: hello-<NAME>
  namespace: default
spec:
  gatewayClassName: cilium
  listeners:
    - name: http
      protocol: HTTP
      port: 80
```   

### Apply the gateway config:
```sh
kubectl apply -f <your-gateway-file>.yaml
```  

### Understanding:   
-   Gateway: Manages traffic routing for multiple services, acting as a single entry point.  
-   Listeners: Define protocols and ports for incoming traffic.  

## 5. Create an HTTP Route yaml file  
Define an HTTP route to connect the gateway to your service, specifying how requests should be handled.  

```yaml  
apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: hello-route-<NAME>
  namespace: default
spec:
  parentRefs:
    - name: hello-<NAME>
  hostnames:
    - "<>.us-east-1.elb.amazonaws.com"
  rules:
    - matches:
        - path:
            type: PathPrefix
            value: /
      backendRefs:
        - name: hello-<NAME>
          port: 80
```  

### Apply the HTTP Route config:
```sh
kubectl apply -f <your-http-route-file>.yaml
```  
### Understanding:  
-   HTTPRoute: Defines how to route HTTP traffic to the backend services.  
-   parentRefs: References the gateway that this route is associated with.  
-   Hostnames: Specifies the domain names that this route will respond to.  

### Additional Resources:  

-   For more details on ingress, refer to the [Kubernetes Ingress Documentation](https://kubernetes.io/docs/concepts/services-networking/ingress/).     
-   Learn more about the [NGINX Ingress Controller here](https://docs.nginx.com/nginx-ingress-controller/).  
-   Explore [Cilium's documentation here](https://docs.cilium.io/en/stable/).   
-   For gateway configurations, see the [Kubernetes Gateway Documentation](https://kubernetes.io/docs/concepts/services-networking/gateway/).   

This guide should help you set up Level 7 access in your Kubernetes cluster effectively while providing a clear understanding of each step involved.

*This guide was created by Alan Peh using course notes from the NTU Cloud Engineering Course, research conducted with Perplexity.ai, and by following guided tutorials provided by instructors.*




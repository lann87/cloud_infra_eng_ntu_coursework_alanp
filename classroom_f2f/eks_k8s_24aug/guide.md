# Level 7 Access in Kubernetes Cluster Tutorial  
This guide provides a comprehensive approach to achieving Level 7 access in a Kubernetes (K8s) cluster. Each step is documented to help you understand what you are doing and why it is necessary. Follow the steps below to set up your environment, create deployments, services, and configure ingress and gateways.  
> (This guide is created by Alan Peh with course note from NTU Cloud Engineering Course, research using perplexity.ai, and going throught the guided tutorial by my instructors.)  


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
Understanding:
>    <clustername>: The name of your EKS cluster.
>    <region>: The AWS region where your cluster is located.
>    This command configures your local kubectl to use the specified EKS cluster, allowing you to manage it using Kubernetes commands.


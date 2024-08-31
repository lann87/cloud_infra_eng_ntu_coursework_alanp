![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  
# Assignment 2.14 - Principles in Cloud Architecture Design - Cost Optimization    
### Group Members: Alif Yusri, Stephen Tan, Azmi Maniku, Jun Jie Wong, Alan Peh, Shafiq Hussein    

## 1. What is Cloud Architecture Design - Cost Optimization?  
Cost Optimization focuses on reducing costs while maximizing efficiency in cloud services. It involves selecting the right services, optimizing resource allocation, and implementing cost management strategies. Key practices include choosing appropriate instance types, using auto-scaling to match resources with demand, and reserving instances for consistent workloads. Monitoring tools track usage and identify savings opportunities. By thoughtfully designing the architecture and regularly assessing resources, businesses can reduce costs while maintaining a responsive cloud infrastructure.  

## Chosen System: E-commerce Architecture Design  
## Strategies:  

### FinOps Adoption  
- Encourage a cost-awareness culture by promoting cost-efficient methods for provisioning and managing cloud resources.  

### Service-Specific Optimization  
- Optimize VMs, containers, and serverless resources:  

### Rightsizing Resources  
- Regularly review resource utilization and adjust sizes (e.g., VMs, databases, storage) to prevent overprovisioning.  

### Reserved Instances   
- Use reserved instances for long-term workloads to save on costs by committing to specific resources for extended periods.  

### Spot Instances (AWS)  
- Utilize spot instances for non-critical workloads, such as batch jobs, where they are significantly cheaper but may be terminated if demand increases.  

### Auto-Scaling   
Implement auto-scaling for web servers to manage traffic spikes during sales/events, ensuring resources are only used when necessary.  

### Serverless Architectures   
Leverage serverless services (e.g., AWS Lambda, Google Cloud Functions) to pay only for actual usage without managing infrastructure.  

### Data Transfer Optimization  
- Reduce data transfer costs by using CDNs, caching, and efficient data transfer methods, which also improve response time.  

### Lifecycle Policies for Storage  
- Adopt lifecycle policies to automatically transition data to lower-cost storage tiers or delete redundant data.  

### Tagging and Cost Allocation  
- Properly tag resources and allocate costs to specific projects/departments to track spending and identify optimization areas.  

### Monitoring and Analyzing Costs  
- Regularly use cloud monitoring tools to track costs, identify underutilized resources, and optimize accordingly.  

## Conclusion:  
Cost optimization is an ongoing process where everyone plays a role in managing cloud infrastructure.

## Additional Notes:  
Implement cost-optimization controls for storage, databases, and analytics.  
Adopt best practices and tools to track and control resource costs.  
Track and review daily application usage.  
Adjust and optimize resources based on requirements.  

## References:  

[AWS Well-Architected Framework - Cost Optimization](https://wa.aws.amazon.com/wellarchitected/2020-07-02T19-33-23/wat.pillar.costOptimization.en.html)  

[Cloud Optimization](https://www.cloudzero.com/blog/cloud-cost-optimization/)  

[15 Best Practices for Cost Optimization](https://spot.io/resources/cloud-cost/cloud-cost-optimization-15-ways-to-optimize-your-cloud/)  

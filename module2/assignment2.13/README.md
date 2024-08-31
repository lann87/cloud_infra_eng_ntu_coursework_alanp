![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  
# Assignment 2.13 - Principles in Cloud Architecture Design - Performance  
### Group Members: Alif Yusri, Stephen Tan, Azmi Maniku, Jun Jie Wong, Alan Peh, Shafiq Hussein    

## 1. Cloud Architecture Design - Performance  

The performance aspect of Cloud Architecture Design focuses on efficiently utilizing computing resources to meet system and performance requirements, ensuring that applications remain fast, responsive, and efficient as demand fluctuates and technologies advance.  

## 2. Implementing Cloud Architecture Design - Performance for an E-commerce System  
To optimize performance for an e-commerce platform, follow a structured approach encompassing selection, design, and monitoring.  

### Selection (Day-0)  
- Understand Workload Requirements: Assess your system’s needs and create a cost-effective, data-driven architecture that optimizes performance.  

### Frontend Layer  
- Content Delivery: Use Amazon CloudFront for low-latency, high-availability content delivery.  
- Static Assets: Store static assets (HTML, CSS, JavaScript) in Amazon S3.  
- Serverless Deployment: Consider Amazon Amplify for serverless frontend deployment.  

### Application Layer  
- Application Logic: Deploy application logic on Amazon EC2 instances or AWS Fargate for   containerized workloads.  
- Database Management: Use Amazon RDS (MySQL, PostgreSQL) for database needs.  
- Caching: Implement Amazon ElastiCache (Redis or Memcached) for caching.  

### Backend Layer   
- Serverless Compute: Use AWS Lambda for tasks like user authentication and notifications.  
- API Management: Leverage Amazon API Gateway for RESTful APIs or GraphQL endpoints.  
- Event-Driven Architecture: Consider Amazon EventBridge for managing events.  
### Scaling and Resilience  
- Auto Scaling: Implement Auto Scaling for EC2 instances to handle varying traffic loads.  
- DNS Management: Use Amazon Route 53 for DNS management and failover.  
- Monitoring: Set up Amazon CloudWatch for monitoring and automated scaling.  
### Review and Monitoring (Day-2)  
- Performance Monitoring: Use CloudWatch for monitoring logs, metrics, and events.  
- Debugging: Implement AWS X-Ray for analyzing application performance and identifying bottlenecks.  

### By following this approach, an e-commerce business can implement a cloud architecture that ensures high performance, scalability, and resilience.


## References:  

[Cloud Architecture Design](https://dataforest.ai/blog/cloud-architecture-design-old-metaphor-new-reading)  

[Cloud Performance and UX](https://moldstud.com/articles/p-impact-of-cloud-architecture-on-application-performance-and-user-experience)


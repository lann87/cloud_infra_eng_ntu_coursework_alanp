![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  
# Assignment 2.11 - Principles in Cloud Architecture Design - Security  
### Group Members: Alif Yusri, Stephen Tan, Azmi Maniku, Jun Jie Wong, Alan Peh, Shafiq Hussein  

## 1. Succinctly explain what is Cloud Architecture Design - Security?   

Cloud Architecture Design - Security involves creating and implementing security measures for a cloud environment. It includes defining security principles, rules, and governance for cloud services and applications. Key components are identity and access management (IAM), data protection and encryption, network and application security, and compliance with regulations. It also involves continuous monitoring, threat detection, and incident response to safeguard cloud infrastructure, data, and applications. The goal is to ensure confidentiality, integrity, and availability of resources while mitigating risks and vulnerabilities.   

## 2. Choose your own system, then succinctly explain how would you implement Cloud Architecture Design - Security on your system  
   
### Chosen System: Ecommerce Architecture Design  

## Application Security:  
- Implement data transmission with proper encryption.  
- Utilize Web Application Firewall (WAF) to protect against common vulnerabilities.  
- Apply data sanitization and code abstraction to prevent injection attacks.  

### Network Security:   
- Use a cloud firewall on the provider side to control and monitor the network.  
- Implement DDoS protection to prevent malicious attacks.  
- Encrypt data transmitted between the platform and users using HTTPS.  
- Use private subnets for sensitive resources and restrict public internet access using NAT gateways.  

### Data Security:  
- Implement automatic data backups and secure data storage procedures.  
- Ensure data protection by encrypting data both in transit and at rest.  
- Minimize human error/data modification by restricting access through IAM with an implicit deny-all policy.  

### Operating the Workload Securely and Managing Identities:  
- Assign security groups and IAM roles/policies for EC2 instances (e.g., Sales, Procurement, Finance) and Lambda functions.  
- Enforce Multi-Factor Authentication (MFA) and strong password security.  

### Detecting and Investigating Security Events:  
- Use AWS CloudWatch for alarms and dashboard monitoring of security events and breaches.  
- Use AWS CloudTrail to log and investigate security incidents.  

### Protecting Data at Rest:  
- Encrypt data using AWS KMS for services like S3, RDS, and EBS.  

### Protecting Data in Transit:  
- Enable TLS/SSL for all communications between services.  
- Use JWT tokens for authentication when performing transactions.  

### Data Protection Summary:  
- Data at Rest: Access control ensures that only authorized users can access and modify data, with access granted on a need-to-know basis.  

### Data in Transit:  
- Sensitive payment/client data is encrypted during transit, and authentication (e.g., JWT tokens) is used for transactions.
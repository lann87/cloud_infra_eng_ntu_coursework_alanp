## Assignment - Brief

# Different companies have different applications and have different architectural needs.   
> As a group, choose among the choices and discuss what kind of servers / server configuration.  virtualization will be needed.

#  1. A deposit / withdrawal system for a rural bank located in the province
Requirement:    Real time processing of transaction, high level infrastructure and data security and reliability, minimal operational downtime.

Server Configuration:
    a. App Server(EC2)- Serves as the link between ATM interface and the Bank's Databank.
    b. Web Server(EC2)- Offering a User interface for customer to access banking services.
    c. Database Server(RDS or DynamoDB for NoSQL options)- Handles most of the Data in coming in from the Bank and ATMs
    d. Monitoring Server(CloudWatch)- For online security and downtime related monitoring on the ATMs
    e. File Server(S3) - Handling forms of digitalised documentation

High potential for scalability and heighten security measures with additional AWS Services such as VPC for isolation and security, IAM for access control.


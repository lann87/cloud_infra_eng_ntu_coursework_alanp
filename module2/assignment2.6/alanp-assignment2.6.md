# Cloud Engineering NTU SCTP - Assignment2.6
Alan Peh Cohort 7  

## Brief
The objective of this assignment is to gain a deeper understanding of AWS permissions and policies and how they can be used to secure access to AWS resources.

### 1: Research

> Research and investigate the concepts of AWS IAM (Identity and Access Management) and the different types of permissions and policies available.  
> Write a report summarizing your experience with IAM, including an overview of the permissions and policies used, any challenges encountered, and any benefits or limitations observed.  
> Provide examples of how these permissions and policies can be used in a real-world scenario.  

**AWS IAM experiences.**  
    - AWS IAM is a tool that allow access to the services and resources securely.  
    - Allows the ability to create and manage AWS user, groups, and use permissions to control access to AWS resources.  
    - IAM is free to use and integrated with many AWS services, making it a useful tool to manage cloud security.  
  
**Main components.**  
    1. Identities  
        - Users: Folks like us.  
        - Groups: Collection of users that shares the same permission.  
        - Roles: Providing temporary credentials.  
    2. Policies  
        - Managed Policies: Predetermined by User(us) or AWS.  
        - Inline Policies: One-use directly applies to user, group or role.  
    3. Permission  
        - Allow/Deny: Access to actions or resources and Deny take precedence over Allow.  

**Challenges Encountered**  
    1. Complexities in policy management when it comes to access privilege level, different type of precedence between component and in particular with large cloud environment.  
    2. Policy validation is particularly a challenge as it has aspect of being repetitive and mundance, automation could be the possible solution and it's something maybe the instructors can address on.

**Summary**  
In conclusion AWS IAM is indeed a powerful tool to manage access to AWS resources, its benefits in terms of security and scalability makes it indispensable for organisations using AWS Cloud. Proper usage, monitoring, and implementation of industry best practices will be essential for effective IAM implementation


### 2: Hands On
> Create a new IAM user with the syntax YOUR NAME + "-temp-user" suffix e.g. luqman-temp-user.  
> Grant this new user you have created access to (i) create, view and delete EC2 instances, (ii) create and view S3 buckets only and (iii) view RDS instances only.  

![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.6/alanp-temp-user_policySC.png)


![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)
# Assignment 2.8 - Software Deployment Requirements  
## Brief - Individual Assignment - Alan Peh
- Discuss within your group about what is the project (e.g. banking application, e-commerce application etc.) that you will run.
- Discuss withn your group about what methodology (e.g. Agile or waterfall or a hybrid) that you will use to run that project and why
- When it comes to deployment, what kind of software deployment methodologies (e.g. Blue-Green, Rolling etc.) would you use and why
- Discuss what CI/CD Pipeline tools (AWS or third-party tools) that you will use.

## 1. Cloud Services Consultant Applications  
We are undertaking a development of a application that aimed at helping small businesses with their cloud infrastructure challenges.  

This application will provide:  
    - Advisory Services: Providing guidances on best practices for cloud infrastructure management, cost effective optimization, and security  
    - Technical Support: Offering personalized assistance to businesses on troubleshooting and resolve their cloud-related issues.  
    - Affordable pricing: We are small business ourselves so we understand the challenges and offer accessible solutions to them.  

## 2. Methodology - Agile  
For this project, the best approach will be adopting the Agile methology, the reasons for this choice being:  
    - **Flexibility**: Agile allows iterative development, which enables us to adapt to changing requirements and feedback from the clients.  
    - **Collaboration**: Regular interaction with clients allow us to understan their needs and provide better services accordingly.  
    - **Faster Delivery**: Agile promotes shorter development cycles, that allows delivery of MVP which is functional component of application quickly, while adding user feedback early in the dev processes.  

## 3. Deployment - Canary  
Reason for Canary deployment strategy are the arious advantageous below:  
    - **Gradual Rollout**: This minimizes risk by ensuring any issues can by identified and addressed early.  
    - **Cost**: Compared to blue-green, Canary deployent can be less resource intensive as they do not require cost of running two development environment.  
    - **Monitoring** - This approach allows real time monitoring of performance and provide feebdback to us and clients.  

## 4. CI/CD Pipeline Tools  
We will use a combination of AWS Services and 3rd Party solutions  
    - **AWS CodePipeline**: To Orchestrate and automate the build, test, and deployment phases.  
    - **AWS CodeBuild**: To Build and Test the application code.  
    - **Terraform**: To manage the IAC component to ensure consistent and repeateable deployment.  
    - **Github Actions**: To facilitate CI(continuous integration) by automating testing and deploment whenever there is code changes pushed into repository.

### By combinging these tools and methodologies, we can create a robust and efficient cloud service application that meet the needs of small businesses.
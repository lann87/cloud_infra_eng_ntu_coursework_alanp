![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# CE7 Assignment 3.8 - Cloud Migration and Microservices

Group Members: Azmi Maniku, Lovell Tan, Wong Teck Choy, Alan Peh  

## There is a lot of complexity when we are using or moving to microservices architecture. As a group, how to solve these challenges when we are moving to microservices  

Overcoming Design Complexity  
Achieving Data Consistency  
**> Need for Testing and Monitoring**  
Debugging Issues  
Compromised Security  
Increased Operational Complexity  
Inter-Service Communication Breakdown  
**> Requires Team Expertise**  
**> Maintenance of Microservices**  
Network Management  

### Choose 3 challenges and break down the solution to how to solve them.  

## Need for Testing and Monitoring

### Monitoring  

Centralized Logging: Aggregate logs from all microservices using tools like ELK Stack (Elasticsearch, Logstash, Kibana) or Splunk. This helps in identifying and diagnosing issues across services.  
Distributed Tracing: Track requests as they flow through various microservices using tools like AWS X-Ray, Jaeger, or Zipkin. This helps in pinpointing bottlenecks and understanding service dependencies.  
Metrics and Alerts: Use Prometheus and Grafana to collect and visualize metrics. Set up alerts for key performance indicators to proactively manage issues.  
Health Checks: Implement health endpoints in each microservice to monitor their status and respond to failures quickly.  

### Testing  

Environment Management: Make extensive use of dev and UAT environments for testing.  
Test management: Ensure high quality test cases are written and passed during QA testing. Using a test management software like Tuskr.  
Unit Testing: Test individual components to ensure each microservice works correctly in isolation.  
Integration Testing: Verify that multiple microservices work together as expected. Tools like Postman or REST-assured can help test if microservices can communicate with each other.  
Contract Testing: Use frameworks like Pact to ensure that the interactions between microservices remain consistent.  
End-to-End Testing: Validate the entire workflow by testing from start to finish. Selenium or Cypress can help automate front-end/browser testing.  
Continuous Integration (CI): Automate your testing process using CI tools like Jenkins, GitHub Actions, or GitLab CI to run your test suites on every code change.  

## Requires Team Expertise

Right Skills and Expertise: Microservices require teams to have a deeper understanding of a wide range of skills eg docker, kubernetes. Hence there needs to be sufficient DevOps, QAs and developers.
Cross functional teams should be put together: members should also have a good mix of product management, data modelling, asynchronous programming, and API development skills to ensure microservice architecture goals are aligned with business goals. 
Reduce knowledge gaps across functions: Given that developers in the company are likely to have a knowledge gap when it comes to the area of DevOps, the organization can consider providing some upskilling/training to ensure both DevOps and Developers are clearer on each others’ role and tasks in the migration and can collaborate more effectively. 
Leverage Expertise with the right team structures: The organization can consider to implement certain team structures depending on what suits their needs and optimises communication and collaboration efficiency. 
Smaller organizations may consider having fan-out team structures with multiple small teams each focusing on business goals and microservice architecture goals for just 1 microservice since communication across teams is already easier.  
Mid-size companies may consider having a central product team focused on microservice goals and reaching out to multiple teams focused on different business goals. This might allow better communication across multiple teams centred around the central product team.
Large companies may consider a lease model with a new central product team with additional loaned engineers from each business functionality that are attached to the central team until the migration of their functionality is completed. This would bridge the knowledge gap between teams more effectively and also ensure more efficient communication with loaned engineers acting as additional messengers between teams. Meanwhile the central team is able to maintain practices and protocols while moving from 1 functionality migration to another.

Maintenance of microservices

App/Api version control strategies
Use GitHub best practices for version control, ensuring effective collaboration and code quality.
Branching strategies:
Adopt GitFlow or Trunk-based development to structure branches efficiently, providing clear workflows for features, releases, and hotfixes.
Pull Requests & Code Reviews:
Incorporate pull requests (PRs) and code reviews to maintain high code quality and identify potential issues before merging.
Version tagging:
Utilize Git tags to track releases, with a detailed changelog maintained for each release.
Versioning:
Apply URI-based versioning or Semantic Versioning (SemVer) to manage backward compatibility and smoother updates.
Use Major, Minor, and Patch tags for updates, changes, or hotfixes, ensuring clear tracking of application progress.

Containerization strategies
Docker
Image Tagging:  
Implement versioned image tagging to track and maintain different versions of your application (e.g., v1.0.0, latest).
Image management:
Use AWS ECR, Docker Hub, or similar registries for secure image storage and registry management.
Dockerfile optimization:
Leverage multi-stage builds and layer caching to optimize image size and build efficiency.

Kubernetes
Resource Management & Auto-scaling:
Use Horizontal Pod Autoscaler (HPA) for dynamic scaling based on CPU/memory metrics and Vertical Pod Autoscaler (VPA) for adjusting resource allocation automatically.
Deployment Strategies:
Implement rolling updates for zero-downtime deployments, and use Canary or Blue-Green deployment to gradually release new versions to a small group of users, reducing risk.
Helm:
Manage Kubernetes applications and versions using Helm charts, allowing for modularity and consistent deployment.
Service Mesh:
Utilize a service mesh (e.g., Istio or Linkerd) for advanced routing, traffic control, network security, and increased observability of microservice interactions.
Code Reviews, CI/CD, and Refactoring
Code Reviews:
Implement peer reviews for code changes to maintain high-quality standards and security within the codebase.
CI/CD with GitHub Actions:
Pipeline Strategy: Use GitHub Actions to automate building, testing, and deploying applications. This will improve development velocity and ensure operational efficiency.
Environment Management:
Set up isolated environments (development, testing, production) for smoother deployments and fewer bugs in production.deployment, and fewer bugs in live production/live environment.
Refactoring:
Regularly refactor code to ensure improved performance, security, and maintainability.

Security
API Gateway:
Use an API Gateway (e.g., AWS API Gateway or Kong) to centralize security, manage access control, authentication, and enforce rate limiting for microservices.
Encryption:
Ensure all communications between microservices are encrypted using TLS/SSL to protect data in transit and safeguard sensitive information.
Monitoring Tools:
Leverage tools like Datadog, AWS CloudWatch, or Prometheus to monitor and detect suspicious activities or security threats across services.
Additions:
Use policies and firewalls to isolate services that don't need to communicate with each other, minimizing the impact if one service is compromised.

Reference :  

![Microservices Testing: Strategies, Tools, and Best Practices](https://vfunction.com/blog/microservices-testing/)

![Microservices Monitoring: An Essential Guide](https://www.liquidweb.com/blog/microservices-monitoring/)

![Benefits of Moving to Microservices Architecture | Medium](https://medium.com/@vbyakod/organizing-teams-to-deliver-microservices-architecture-96ad0255374f)

![Benefits of Moving to Microservices Architecture | PwrTeams](https://pwrteams.com/content-hub/blog/articles/benefits-of-moving-to-microservices-architecture)

![15 Best Practices for Building a Microservices Architecture | BMC](https://www.bmc.com/blogs/microservices-best-practices/)

![10 best practices for managing data in microservices | TechTarget](https://www.techtarget.com/searchdatamanagement/tip/Best-practices-for-managing-data-in-microservices)

![What’s the Difference Between Monolithic and Microservices Architecture? | AWS](https://aws.amazon.com/compare/the-difference-between-monolithic-and-microservices-architecture/)

![Refactor a monolith into microservices | Google Cloud](https://cloud.google.com/architecture/microservices-architecture-refactoring-monoliths)

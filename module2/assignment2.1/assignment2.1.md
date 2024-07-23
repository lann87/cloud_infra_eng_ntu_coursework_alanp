# CE7 SCTP - Assignment 2.1
## Group 1 members: Alif Yusri, Azmi Maniku, Andy Liew, Alan Peh
### The objective of this assignment is to gain a deeper understanding of cloud computing, hybrid computing and traditional computing and the benefits and limitations of each.

1. **Choose a specific use case (e.g. a small business, a startup, a large enterprise) and determine which computing model would be the most appropriate for that use case, providing a detailed explanation of your reasoning.
-	Newly launched e-commerce website using public cloud.**
    - Scalability
        - Ability to expand capabilities as and when it’s required e.g. Event/Festive Season
    - Cost-efficiency
        - Less upfront cost for public cloud vs hybrid or on prem. Opex vs Capex model.
    - Infrastructure management
        - Cloud providers take care of hardware maintenance. Ease of management of resources from cloud console/cli/terraform/etc. All required services (VMs, Databases, Storage, etc) are consolidated with one provider.
    - Availability
        - With different Ecommerce infrastructure being hosted across different availability zones making sure there is minimal operating downtime.

2. **Compare and contrast the benefits and limitations of each model, including cost, scalability, security, and flexibility.**

|                           | Cloud                            | Hybrid                           | Traditional (On-prem)                     |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Cost**                  | Lower costs                      | Cost-efficient                   | High Upfront Cost for hardware. Also cost |
|                           | (pay for what you need)          | (balanced)                       | for IT professionals to maintain hardware.|
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Scalability**           | Easy and Quick                   | Flexible scaling                 | Scalable depending on hardware. Takes more|
|                           | to scale up/down.                | (can scale on cloud or on-prem)  | time and effort to scale up. Hard to scale|
|                           |                                  |                                  | down.                                     |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Security (data)**       | High                             | Higher                           | Highest                                   |
|                           | (All data stored on the cloud)   | (Sensitive data on-prem, other   | (All data stored on premises)             |
|                           |                                  | on cloud)                        |                                           |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Security(vulnerability**| Shared responsibility. Only      | Shared responsibility. Able to   | Full responsibility. Significant time and |
| **patching)**             | responsible for your own VMs. No | dictate the level of security on | effort required for security maintenance  |
|                           | need to worry about              | cloud and on-prem. Eg: Procuring | and patching of applications/OSes/        |
|                           | infrastructure.                  | your own database/server for     | firmwares of hardware/etc.                |
|                           |                                  | sensitive information            |                                           |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Flexibility of**        | Medium                           | High                             | Low                                       |
| **resources**             |                                  |                                  |                                           |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Access to range of**    | Has the most readily available   | Able to leverage on both on-prem | Cost-dependent on the tools/resources     |
| **tools & services**      | tools/services ready to use by   | and cloud resources              | needed. Liaise with multiple vendors for  |
|                           | the cloud provider.              |                                  | similar services.                         |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Flexibility**           | Easy to move regions, increase   | Middle ground between cloud and  | Depending on the range of hardware        |
| **(elasticity)**          | availability, spin up and test   | on-prem.                         | available. Eg: Multiple server racks/     |
|                           | various cloud services and       |                                  | networks needed to maintain easy access if|
|                           | destroy them later.              |                                  | a service is down                         |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Reliability &**         | Highly reliable and              | Cloud services will be highly    | Creating high availability and reliability|
| **Availability**          | available with redundancies and  | reliable/available while on-prem | similar to cloud providers is highly      |
|                           | SLAs provided by cloud providers.| services will be dependent on    | costly and takes significant effort. And  |
|                           |                                  | cost and effort.                 | you may not be able to do things like     |
|                           |                                  |                                  | multi-region.                             |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Performance**           | Dependent on internet            | Leveraging both local and cloud  | Potentially high performance, limited by  |
|                           | connectivity; potential latency  | resources                        | local hardware                            |
|                           | issues                           |                                  |                                           |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Disaster Recovery**     | Good with various cloud provider | Enhanced recovery options by     | Good but can be costly.                   |
|                           | services and redundancy.         | combining local and cloud backups|                                           |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Speed of Deployment**   | Fastest deployment speed         | Moderate dependent on setup      | Slow deployment speed                     |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Compliance**            | Compliant with various           | Easier to meet regulatory        | Easier to ensure data sovereignty, but    |
|                           | regulations; data sovereignty    | requirements by keeping data on- | requires significant efforts              |
|                           | could be an issue                | prem                             |                                           |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|
| **Innovation**            | High as they can gain access to  | High as they can add in latest   | Costly to compete with what cloud         |
|                           | latest services from providers   | tech and services by leveraging  | provider can offer in terms of innovation |
|                           |                                  | existing hybrid setup            | and GPUs                                  |
|---------------------------|----------------------------------|----------------------------------|-------------------------------------------|

1. **Write a report summarising your research, including a comparison and contrast of the different computing models and an analysis of the chosen use case.**
- For new e-commerce startups, cloud computing is the way to go. It offers:
    - unbeatable scalability to handle traffic spikes
    - keeps costs down with a pay-as-you-go model. 
    - manage the tech, often providing attractive onboarding packages for startups, boosting availability 
    - Content Delivery Network (CDN) offerings to speed up content delivery to improve user experience globally
    - provides built-in disaster recovery and back-up solutions, to ensure data protection for swift restoration in case of outages
    - enhances and innovates the e-commerce platform, via quick access to tools like AI, machine learning, data analytics and more.
    - Rapid deployment to update the e-commerce site, reducing time-to-market
- Overall, this setup is more well-rounded in terms of flexibility, cost-effectiveness, scalability, performance, ease of management and innovation-friendly compared to alternatives, making it ideal for app-first businesses in today's fast-paced digital marketplace. With cloud, e-commerce companies can easily adapt to market changes and gain valuable insights with cutting edge machine learning and AI powered services into consumer behaviour, setting themselves up for success in the competitive online retail world.

Reference:
https://sptel.com/on-premise-vs-cloud-computing/
https://www.commvault.com/glossary-library/on-premises-cloud-and-hybrid#:~:text=On%2Dpremises%20solutions%20involve%20hosting,premises%20and%20cloud%2Dbased%20systems.
https://www.cleo.com/blog/knowledge-base-on-premise-vs-cloud
https://www.aztechit.co.uk/blog/cloud-computing-vs-traditional#:~:text=Traditional%20computing%20involves%20the%20use,%2C%20storage%2C%20and%20processing%20power.

## Assignment Brief - Group 1: Alif Muhd, Azmi Maniku, Andy Liew & Alan Peh
> Within groups, you will be tasked to choose one of the scenarios below and discuss how would you design tihe server architecture for the selected scenario based on the methods we've discussed in class today.

## Case:
>   **eCommerce e.g. Shopee/ Lazada -> Group 1**  
>   Financial Institution e.g. DBS Mobile Banking app  
>   Government e.g. IRAS Tax System  
>   Personal Static Website e.g. Wordpress blog  
>   eMail Application e.g. Gmail  
>   Ride-Hailing application e.g. Grab/ Gojek  
>   Mobile Gaming application e.g. PUBG  

## Method:
>    Clustering, Load Balancing, Containerization or Virtualization, Whitelisting, Blacklisting.  

## **Server architecture for Ecommerce (Shopee)**
**Architecture constraints:**  
-   APAC region (localized to individual regions)  
-   Cloud native  
-   Expected spikes in usage during sales, post-office hours and weekends  

1.  **Clustering**  
    ○ Use high availability clustering with multiple servers per AZ and in multiple
    APAC regions.   
    ○ HA: Active-Active   
    ○ Implemented across multiple layers (web servers, microservices, databases) to ensure high availability and fault tolerance   

2.  **Load Balancing Layer**   
    ○ Multiple application load balancers to distribute incoming traffic   
    ○ Implements health checks and SSL termination   
    ○ Must be able to handle surprise spike in bandwidth, to utilise auto-scaling during peak usage of application.   
    ○ Application load balancing across APAC regions, and also across availability zones.   
    ○ Used at the entry point to distribute traffic evenly across web servers, preventing any single point of failure and enabling horizontal scaling  

3.  **Web Application Layer**   
    ○ Clustered containerized web servers   
    ○ Horizontally scalable for handling variable traffic   

4.  **Microservices Layer**
    ○ Containerized microservices for specific functions (e.g., user management, product catalog, order processing)   
    ○ Deployed across multiple nodes for high availability   
    ○ for future application feature upgrades and easy maintenance, facilitate rapid deployment, and enable efficient resource utilization   

5.  **Caching Layer**  
    ○ Distributed caching system   
    ○ Improves performance by caching frequently accessed data   

6.  **Database Layer**   
    ○ Clustered database servers   
    ○ Primary-secondary replication for data redundancy and read scaling   

7.  **Storage Layer**   
    ○ Distributed file storage for product images and static assets    

8.  **Content Delivery Network (CDN)**   
    ○ APAC CDN for serving static content and improving load times   
    ○ Edge/local zones to be utilised for specific tasks   

-   **This architecture is designed to be scalable, resilient, and performant, capable of handling the high traffic and complex operations typical of large eCommerce platforms like Shopee.**     

**Sources:**  
-   Contributions by Alan Peh, Azmi Maniku, Andy Liew and Alif Muhd  
> 1. [Software Architecture][https://www.linkedin.com/advice/1/what-best-software-architecture-patterns-e-commerce-zwl1c]  
> 2. [Data Infra Engineering][https://careers.shopee.sg/blog/2021/02/22/data-infrastructure-engineering/]  
> 3. [Cluster Architecture][https://www.znetlive.com/blog/how-cluster-architecture-benefits-data-base-web-applications/]  
> 4. [Setup Optimization][https://cloudkul.com/blog/setup-optimized-e-commerce-store-high-availability/]  
> 5. [Virtual vs Container][https://www.liquidweb.com/blog/virtualization-vs-containerization/]  
> 6. [Ecommerce Web-Development][https://www.bigcommerce.com/articles/ecommerce-website-development/ecommerce-architecture/]  
> 7. [What is Server Cluster][https://www.liquidweb.com/blog/what-is-server-cluster]



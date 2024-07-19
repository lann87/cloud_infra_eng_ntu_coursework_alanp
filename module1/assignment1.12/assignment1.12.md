# 1.12 Disaster Recovery - Ecommerce
## Group: Azmi Maniku, Andy Liew, Alif Yusri and Alan Peh
**Work with your group to define your own business and your own recovery plan based on discussed threats that might happen to your business**

### Define your business at a high-level:  
Our business is a large-scale Ecommerce platform operating in Singapore and Southeast Asia. The platform connects a large number of buyers and sellers, offering a wide range of product. and services across many categories. Key features:  
- Online marketplace  
- Integrated payment system  
- Mobile-first approach with a priority on app-based services  
- Southeast Asian region across Availability Zones  

### Define your company's assets:  
**Critical**  
- Payment services  
- User base; large, growing customer base with wide market of sellers and range of products for buyers  
- Cloud services, including web and mobile applications and AI-driven recommendation engines

**important**  
- Chat feature for real-time communication between clients and vendors  
- Customer Data Analytics to understand customer behavior, optimize operations, and provide personalized shopping experiences    
- Logistics network for efficient supply chain management, ensuring reliable and timely deliveries through partnerships  
- Others: Mini Games for earning vouchers

### Define your possible threats
**Critical**  
- Cybersecurity attacks - DDoS, hacking (data breach), ransomware  
- Internet/Network Outages - Regional outage or undersea cable damage  
Cloud Infrastructure failure - Cloud datacenter power outage  

**Important**
- Logistics disruptions due to natural disasters (earthquakes, volcanoes, tsunamis) or geopolitical tensions  
- Man-made disasters - e.g., pandemics like COVID-19  
- Currency fluctuations; currency risk affects revenue and profitability  

### Define Your RTO and RPO  
**Recovery Time Objective**  
- Application: 5min  
- Payment: 5min  
- Client database: 5min  
- Customer Data Analytics: 60min  
- Inventory static storage Database: 60min  
- Chat feature / Bots: 60min  
- Mini Games: 6 hours  

**Recovery Point Objective:**  
- All critical cloud services/features are backed up every 5 min.  
- Non-critical services are backed up every 30 min.  
- Backups are retained for 48 hours.  


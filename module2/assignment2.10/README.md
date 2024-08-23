![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)
# Assignment 2.10 - CDN & AZs
### Individual CloudFront deployment & theoretical CDN assignment - Alan Peh

## 1. Hands-on assignment - CloudFront /w S3 deployment:  
- Deployment of a staticpage on CloudFront  
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.10/Static-page-cloudfront.png)  
- CloudFront console with origin pointed to S3 bucket  
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.10/alanp-cloudfront-console.png) 
- Bucket Policy
![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module2/assignment2.10/s3-assignment210-bucketpolicy.png)  

## 2. Theoretical assignment:  
You will be assigned a simple topic to work on as a group by your instructor. The questions include:  

- Explore the difference between AWS CloudFront and a commercial 3rd party tool like Cloudflare. In what situation would you use CloudFront over Cloudflare and vice versa?

```
Depending on how invested the organisation is into AWS services, as CloudFront integrates seamlessly well with other services. While Cloudflare has wide range of 3rd party integration if you're using more opensource tools.  
Pricing wise CloudFront is a pay as you go model, and Cloudflare has Free and Paid tiers.
```

- Explore the difference between AWS CloudFront and a caching tool like AWS Elasticache. What are the differences between the two? When would you use CloudFront and when would you use Elasticache?  

```
CloudFront is a CDN that caches and delivery content globally, while ElastiCache caches data in RAM for quick access. Depending on what you need as CloudFront is utilized on content such as images, CSS, js, and ElastiCache stores dynamic content or session data for web applications.
CloudFront works with S3, EC2 and ELB. ElastiCache inegrates with EC2, RDS, DynamoDB as a caching layer.
```

- Is AWS CloudFront a secure CDN? How does security in CloudFront work? Is CloudFront sufficient without alternative security tools like AWS DDoS Protection, WAF and Shield?  

```
CloudFront is a secure CDN with basic HTTPS, general encryption and signed URLs/cookies for secure content delivery. It can be integrated with AWS robust suite of security features like WAF, Shield for wide range of protection.  
Yes, CloudFront by itself is secure enough for most use cases, but for higher risk applications do consider using those two options mentioned earlier or 3rd party security tools for added protection.
```

- Is AWS CloudFront better than other cloud providers' CDN tools? Do a quick research to illustrate the similarities and differences between the AWS, GCP and Azure CDNs.  


```
All major cloud provider offers CDN services with global point of presences(pops) and edge caching, however CloudFront has significantly more pops among the major cloud provider.  
AWS has tighter AWS service integration, while Azure CDN and Google Cloud CDN has broader 3rd party support.  
Pricing and Security aspect all major cloud provider has well rounded offerings.  
```

References:   
    1.  https://cloud.folio3.com/blog/amazon-cloudfront-vs-cloudflare/  
    2.  https://jayendrapatil.com/aws-storage-options-cloudfront-elasticache/  
    3.  https://www.opstergo.com/blog/cdn-comparison  

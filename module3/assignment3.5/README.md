![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# DevSecOps - Assignment 3.5 - Cloud Native Deployment - Containerization II  

## Individual assignment - Create ECS & ECR via Console/Terraform

14 Oct - Alan Peh  

I am deploying a simple Flask app to AWS using ECS and ECR with Terraform. The app runs a web server that displays a message, and the Dockerfile builds the container image, which is pushed to ECR. Terraform automates the ECR setup with security scanning, and ECS manages the containers. The deployment involves two task definition revisions, reflecting updates to the app over time.  

Tools: AWS ECS, ECR, Docker, Flask, and Terraform.  

### Deployment files

app.py  

```py
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<p>Hello, Alan!</p>"

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080)
```

Dockerfile  

```sh
FROM python:latest

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["python"]
CMD ["app.py"]
```

ecr.tf

```tf
resource "aws_ecr_repository" "ap-cnd-container-14oct" {
  name                  = "ap-cnd-container-14oct"
  image_tag_mutability  = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
```

### ECS - Deployment of Application

CLI curl  
![Alt Text](https://github.com/lann87/cnd-containerizationII-14oct-/blob/main/resources/14oct-ecs-curl.png)

Web browser  
![Alt Text](https://github.com/lann87/cnd-containerizationII-14oct-/blob/main/resources/14oct-ecs-web.png)

### ECS Cluster and ECR

Elastic Container Service Cluster  
![Alt Text](https://github.com/lann87/cnd-containerizationII-14oct-/blob/main/resources/14oct-ecr-clusteroverview.png)

Elastic Container Registry  
![Alt Text](https://github.com/lann87/cnd-containerizationII-14oct-/blob/main/resources/14oct-ecs-ecr.png)

### ECS - Task Definitions with 2 revisions

taskdef1  
![Alt Text](https://github.com/lann87/cnd-containerizationII-14oct-/blob/main/resources/14oct-ecr-taskdef1.png)

taskdef2  
![Alt Text](https://github.com/lann87/cnd-containerizationII-14oct-/blob/main/resources/14oct-ecr-taskdef2.png)

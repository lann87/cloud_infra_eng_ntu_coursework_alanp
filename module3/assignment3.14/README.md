![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# Assignment 3.14 - Package Vulnerability Scan

## Individual Assignment - Package Scan on Github Actions with Snyk

**Date**: 13 Nov  
**Author**: Alan Peh

## Project Overview  

Created a simple Docker containerized Python application with automated security scanning using Snyk and GitHub Actions.  

**Github Actions Snyk Scan Overview**
![Alt Text](https://github.com/lann87/13nov-vulnscan-snyk/blob/main/resource/13nov-snyksumm.png)

**Snyk Scan Summary**
![Alt Text](https://github.com/lann87/13nov-vulnscan-snyk/blob/main/resource/13nov-snykres.png)

### Components  

1. **Application**  
   - Simple Python Hello World application  
   - File: `helloworld.py`  
   - Content: `print("Hello world")`  

2. **Snykscan.yaml and Dockerfile Configuration**  

**snykscan.yaml**  

```yaml
name: Snyk Container Security Scan

on:
push:
    branches: [ "main" ]
pull_request:
    branches: [ "main" ]

jobs:
snyk-scan:
    runs-on: ubuntu-latest
    steps:
    # Get the code
    - name: Checkout code
        uses: actions/checkout@v4

    # Build using your Python Dockerfile
    - name: Build Docker image
        run: docker build -t python-hello:${{ github.sha }} -f Dockerfile .

    # Scan the built image with Snyk
    - name: Run Snyk Container Scan
        uses: snyk/actions/docker@master
        env:
        SNYK_TOKEN: ${{ secrets.SNYK_TOKEN }}
        with:
        image: python-hello:${{ github.sha }}
        args: --file=Dockerfile --severity-threshold=medium
        continue-on-error: true  # Don't fail on low severity issues
```

**Dockerfile**  

```dockerfile
FROM python:3.11-slim-bookworm
WORKDIR /app
COPY python/helloworld.py .
CMD ["python", "helloworld.py"]
```

3. **GitHub Actions Workflow**  
   - Implemented automated Snyk security scanning  
   - Triggers on push and pull requests to main branch  
   - Scans Docker image for vulnerabilities  

### Initial Scan Results  

- Base image vulnerabilities detected:  
  - Multiple low severity issues in wget package  
  - Low severity issues in util-linux/libuuid1  
  - Low severity vulnerability in unzip package  
- No vulnerabilities found in application dependencies  

### project-directory  

repository-root/
├── .github/
│   └── workflows/
│       └── snyk-docker-scan.yml
├── python/
│   └── helloworld.py
└── Dockerfile

![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# Assignment 3.3 - Deploying Cloud Native App  

## Individual Assignment - Creating a Web Application using Node.js

**Date**: 07 Oct  
**Author**: Alan Peh  

## Deployment of Node JS application

**Deployed and Curled using CLI**  
![!Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/module3/assignment3.3/resource/a3.3-node-cli-curl.png)

### Dev Steps

1. **Create & Clone Repository**

2. **Node.js Setup**
   - Run `npm init` (accept defaults)
   - Run `npm install express`

3. **Application Code**

  **index.js**  

  ```js
  // before rum
  //npm install express

  // to run 
  // npm start

  'use strict';

  const express = require('express');

  // Constants
  const PORT = 8082;
  const HOST = '0.0.0.0';
  const OS = require('os');
  const ENV = 'DEV';


  // App
  const app = express();
  app.get('/', (req, res) => {
    res.statusCode = 200;
    const msg = 'Hello There!';
    res.send(msg);
  });

  app.get('/test', (req, res) => {
    res.statusCode = 200;
    const msg = 'Hello from /test Node!';
    res.send(msg);
  });

  app.listen(PORT, HOST);
  console.log(`Running on http://${HOST}:${PORT}`);
  ```

4. **Test & Deploy**  

   - Start app: `node index.js`
   - Visit: http://localhost:3000

5. **Git Workflow**  

   - `git checkout -b feature/initial-setup`  
   - `git add .`  
   - `git commit -m "Initial web application setup"`  
   - `git push origin feature/initial-setup`  
   - `git checkout main`  
   - `git merge feature/initial-setup`  
   - `git push origin main`  
   - `git pull origin main`  

**Simple Docker Check**  

```yaml
name: Docker CI

on:
  push:
    branches:
    - main

env:
  IMAGE_NAME: alanp-dimage
  IMAGE_TAG: ${{ github.sha }}

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v4

    - name: Set up Docker Buildx
      uses: docker/setup-buildx-actions@v3

    - name: Dockerhub Login
      uses: docker/login-actions@v3
      with:
        username: ${{ secrets.DOCKER_USERNAME }}
        password: ${{ secrets.DOCKER_PASSWORD }}

    - name: Build Docker Image
      run: |
        docker build . -t ${{ env.IMAGE_NAME }}:${{ env.IMAGE_TAG }}

    - name: Push Docker Image
      run: |


    - name: Docker Container Testing
      run: docker run . -t
```

## Project Structure  

```sh
your-project/
├── node_modules/
├── index.js
├── package.json
└── package-lock.json
```

## Best Practices  

1. **Development**  
   - Use .gitignore for node_modules  
   - Document setup in README.md  
   - Keep dependencies updated  

2. **Git Workflow**  
   - Use feature branches  
   - Test before merging  
   - Pull before new work  

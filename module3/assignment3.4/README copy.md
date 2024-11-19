![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# Assignment 3.3 - Deploying Cloud Native App  

## Individual Assignment - Deploying Cloud Native App  

**Date**: 07 Oct  
**Author**: Alan Peh  





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

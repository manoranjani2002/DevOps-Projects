# Deploying Node.js Demo Web Application using OpenShift

**This guide outlines the steps to build and deploy a Node.js demo web application to OpenShift using the OpenShift CLI. Additionally, it includes instructions for enabling webhooks to automate deployment when changes are pushed to the Git repository.**

![Screenshot 2024-03-13 015102](https://github.com/safuvanh/DevOps-Projects/assets/156053146/3607cb7c-7c7f-4a1d-854f-0ac79e37c672)

## Prerequisites

Before proceeding, make sure you have the following:

- AWS Ubuntu instance or similar server
- OpenShift account
- OpenShift CLI (`oc`) installed on your local machine
- Git source code for the Node.js demo web application

## About OpenShift

 ![0_Mm-KtIc6o0C6eKtd](https://github.com/safuvanh/DevOps-Projects/assets/156053146/7874e8cd-3db3-4e01-92c9-64c6186a57db)

 

**OpenShift is a cloud computing platform as a service (PaaS) offered by Red Hat. It allows developers to build, deploy, and manage applications on the cloud with ease. Some key features of OpenShift include:**

- Kubernetes-based container orchestration
- Support for various programming languages and frameworks
- Built-in CI/CD pipelines
- Scalability and high availability
- Monitoring and logging capabilities

To learn more about OpenShift, you can refer to the [OpenShift documentation](https://developers.redhat.com/learn/openshift/foundations-openshift).

## Source-to-Image (S2I) in OpenShift

   ![0_xaHK1n4RhpfgF3JT](https://github.com/safuvanh/DevOps-Projects/assets/156053146/3d3cbefe-f6f1-4277-a0f5-31c0c345516f)

   
   **Source-to-Image (S2I) is a powerful tool in OpenShift for building reproducible container images directly from application source code. It streamlines the process of creating containerized applications by automatically injecting the source code into a container image and running build scripts to produce the final image.
     This README provides an overview of the S2I method in OpenShift**

     

## Step 1: Set Up OpenShift

1. Log in to your OpenShift account.
2. Create a new project or select an existing project where you want to deploy the application.
3. Make sure you have the necessary permissions to create resources within the project.

## Step 2: Install Openshift CLI

- Launch an ubuntu instance and connect using ssh
- create shell script for configure Openshift CLI
- vim `openshift.sh`

   
   ![Screenshot (254)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/8b59fb65-ca79-482d-8006-056ef4883979)

- **give execute permission for shell script `chmod +x openshift.sh`**
- **run script `./openshift.sh`**
- **login to Openshift using command `oc login `**
   ```
   oc login --token=************ --server=https://api.sandbox-m3.1530.p1.openshiftapps.com:6443
   ```
- **You can copy the token from Openshift account**
   
   ![Screenshot (255)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/686cf7f3-48f1-4f2c-9d4c-36a10b4cd443)

- **After successfull login enter command for `oc projects` for viewing existing projects**

  ![Screenshot 2024-03-13 002152](https://github.com/safuvanh/DevOps-Projects/assets/156053146/9c4b69ba-e4dd-4233-8f39-db42ff4fb012)

- **Create deployment by import its source code from git**
   ```
   oc new-app https://github.com/safuvanh/Nodejs-Basic-Demo --name nodejs
   ```
  ![Screenshot 2024-03-13 002651](https://github.com/safuvanh/DevOps-Projects/assets/156053146/e0b220af-00d8-4d3b-aba8-018e32a6fd6a)
  
- **To expose  service `oc expose service/nodejs` This command creates a route to the service, making it accessible from outside the OpenShift cluster.**
  
  ![Screenshot 2024-03-13 002812](https://github.com/safuvanh/DevOps-Projects/assets/156053146/3d67e615-54c1-467a-b2e6-b9cce520d2d9)

- **For viewing created pods and services enter the  command `oc get pods` `oc get services`**
  
  ![Screenshot 2024-03-13 003006](https://github.com/safuvanh/DevOps-Projects/assets/156053146/ce3b9b08-a9b2-40dd-adc9-d078332d8cce)

- **`oc get routes` for view routes**
- **`oc status` for check status of deployment**
- **`oc logs -f build/nodejs` for view build logs**                     
- **`oc get bc` for view build information**
- **`oc describe bc/nodejs` for describe build**

  ![Screenshot (259)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/72763fbd-e50b-4b55-8375-4cdf2e8fc4a0)

- **Enter this command `oc get route nodejs` and copy url and browse it**

  ![Screenshot (257)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/9e19100f-0665-4f56-8efa-89996f788de9)
 

- **Now, we add webhook trigger in github. it will automatic build and deploy when code updating**
- **copy the webhook link with secret from Openshift Console**

  
  ![Screenshot (260)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/bedc3b29-67fe-4236-8e77-fafba68cfa4a)

- **Add webhook in Github Repository Settings**

  ![Screenshot (261)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/313b8234-df8d-4bd3-85e2-709253a612ea)

- **then change the source code it will start automatic new build and deploy it**

  ![Screenshot (265)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/0fbbd544-1e0b-4793-81f8-64653d1fd19f)

  ![Screenshot (266)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/ecac2882-cfe3-4a6c-b629-57c385531d54)

- **Refresh the url, it will update a changed content**

  ![Screenshot (267)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/c92f3c52-93ba-4856-bd53-0cf62ff5a3d4)


## Destroy Services

   - **Now we destroy all services by entering these commands**
     ```
     oc delete pods --all
     oc delete services --all
     oc delete routes --all
     oc delete bc --all
     ```
     ![Screenshot 2024-03-13 005848](https://github.com/safuvanh/DevOps-Projects/assets/156053146/7d2bdb6e-cc22-441b-b91c-4c80a998ce5a)


    



  


  
  





  


     

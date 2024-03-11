# Zomato Clone React App CI/CD Pipeline

This project sets up a Continuous Integration and Continuous Deployment (CI/CD) pipeline for the Zomato Clone React App using Jenkins.

## Overview

The Zomato Clone React App is a web application that replicates the core features of the popular food delivery platform Zomato. This project focuses on setting up a CI/CD pipeline to automate the build, test, and deployment processes.

## Prerequisites

Before setting up the CI/CD pipeline, ensure you have the following prerequisites:

1. **AWS Instance:**
   - Launch an AWS EC2 instance to host your Jenkins server and serve the React app.
   - Launch an Ubuntu Server instance (e.g., Ubuntu 20.04 LTS) with sufficient resources to run Jenkins, Node.js, and Nginx.

2. **Jenkins:**
   - Install and configure Jenkins on your AWS instance.
   - Set up Jenkins plugins such as Git and Pipeline.
    

3. **Node.js and npm:**
   - Install Node.js and npm on your AWS instance to build and run the React app.
   - Verify the installation by running `node -v` and `npm -v` commands.

4. **Nginx:**
   - Install and configure Nginx on your AWS instance.
   - Set up Nginx to serve static files from the `/var/www/html` directory.

## Installation Steps

   - create a shell script file ``` vim jenkins.sh ```
     
     ![Screenshot (233)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/09313d50-32bf-49e2-aa38-e68d3e3c0888)

   - ```
     chmod +x jenkisn.sh
     ./jenkins.sh
     ```
## Jenkins Setup

   - Browse `https://<instance_public_ip>:8080`
   - login with Administrator Password
   -  ```
      cat /var/lib/jenkins/secrets/initialAdminPassword
      ```
   - Create a user for Access Jenkins

     ![Screenshot (229)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/72d346e4-66e0-4730-aa7b-5564e95fe7b1)

   - Install plugins Nodejs & Github Integration
     

     ![Screenshot (230)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/1fb486d5-e2dc-45aa-9909-e82921b269ba)


    
     



## Pipeline Description

The CI/CD pipeline consists of the following stages:

1. **Git Clone:** This stage clones the Zomato Clone React App repository from GitHub, specifically targeting the `main` branch.

2. **Install Dependencies:** This stage installs the necessary dependencies required for building and running the React app using npm.

3. **Build:** This stage builds the React app using the `npm run build` command. It compiles the JavaScript and CSS files and generates an optimized production build.

4. **Deploy:** This stage deploys the built React app to the web server. It copies the contents of the `build` directory to the `/var/www/html` directory, which is a common location for serving static files on a web server.


## Customize Pipeline


   ![Screenshot (232) - Copy](https://github.com/safuvanh/DevOps-Projects/assets/156053146/5c41a8df-02bb-455c-9cf2-2006ea9d9b4d)


   - Build the pipeline

     ![Screenshot (234)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/28e1fd77-7b66-45e2-8a9f-223498b84961)

     ![Screenshot (235)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/8af3ef56-c85e-4b64-9c17-70801bebd2d8)


   - Browse the `https://<Instance_public_ip>`  For Output


     ![Screenshot (236)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/22a318c9-2e85-4ce2-9188-ef55c59ae4b3)

   - Now , we need to configure github hook trigger in pipeline for CI/CD performs

     ![Screenshot (231)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/a89ed828-8f0a-4df1-b239-81fa669edcc3)

   - Create a webhook on github repo settings
   - Add url `https://<instance_ip>:8080/github-webhook/`
   - content type - `application/json`


     ![Screenshot (238)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/8e885302-2459-4da6-a245-e8cf81ef82d1)

   - Then change the source code of React App for justify the CI/CD performs

     ![Screenshot (239)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/1096e05e-e8f9-43ba-9ba0-c49bbbbea8b7)

   - Commit changes, it will new build the pipeline automatically

     ![Screenshot (240)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/9069316c-53a3-44d0-a411-3180a7a8e761)


     ![Screenshot (241)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/e175e2c9-0e83-4be3-bf8a-63580e5c8e18)


   - To view updated content, refresh the browser

     ![Screenshot (243)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/0cc0de54-6416-4f53-92bf-fd60479d7192)




     

      

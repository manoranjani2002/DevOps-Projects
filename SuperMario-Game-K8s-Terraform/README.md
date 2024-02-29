# Deployment of Super Mario-Game on Kubernetes using Terraform

This project demonstrates how to deploy a Super Mario game server on AWS EKS using Terraform for infrastructure provisioning.

## Overview

Super Mario holds a timeless appeal, cherished by countless enthusiasts as a beloved classic video game..


![supermario](https://imgur.com/rC4Qe8g.png)

This project aims to deploy a Super Mario game server on a Kubernetes cluster, making it accessible to players over the internet. The infrastructure provisioning is handled by Terraform, which automates the deployment process.

## Prerequisites

Before you begin, ensure you have the following installed:

- [Terraform](https://www.terraform.io/) - for provisioning infrastructure
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) - Kubernetes command-line tool
- A Kubernetes cluster configured and accessible
- Docker: Docker is required for containerization. You can install Docker by following the instructions provided on the [Docker website](https://docs.docker.com/get-docker/).
- AWS CLI: If you're deploying to AWS, you need AWS CLI to interact with AWS services. You can install AWS CLI by following the instructions provided [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html).

## Launching an Ubuntu Instance

1. Sign in to your AWS console.
2. Launch a new Ubuntu instance.
3. Connect to the instance via SSH

## Installation Steps:

1. Update package lists:

    ```
    sudo apt update
    ```

2. Install Kubernetes tools:

    ```
    sudo apt install -y apt-transport-https curl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
    echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
    ```

   
3. Verify Kubernetes installation:

    ```
    kubectl version --client
    ```

   ![Screenshot 2024-02-29 155022](https://github.com/safuvanh/DevOps-Projects/assets/156053146/8e76816f-5dc5-4a28-ab7c-4e58fb36806a)



4. Install Terraform:

    ```
   wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
   sudo apt update && sudo apt install terraform
    ```

   ![Screenshot 2024-02-29 154859](https://github.com/safuvanh/DevOps-Projects/assets/156053146/b009fc09-f3b1-4625-9295-a4a925cdbdd8)

5. Setup AWS CLI

   ```
   curl “https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o “awscliv2.zip”
   sudo apt-get install unzip -y
   unzip awscliv2.zip
   sudo ./aws/install
   aws configure
   ```

   - Give AWS credentials for AWS configure

   ![Screenshot 2024-02-29 154936](https://github.com/safuvanh/DevOps-Projects/assets/156053146/0044a6bd-9615-482d-8557-a973c6a2679d)


6. Install Docker:

   ```
   apt install docker.io -y
   usermod -aG docker "your username"
   newgrp docker
   
   ```

   ![Screenshot 2024-02-29 154737](https://github.com/safuvanh/DevOps-Projects/assets/156053146/3af8f183-3ebb-4a7a-a7bd-2ce377b1ecdd)


   
   
## Deployment Steps

1. Clone this repository:

    ```
    git clone https://github.com/safuvanh/DevOps-Projects.git
    ```

2. Navigate to the project directory:

    ```
    cd DevOps-Projects/SuperMario-Game-K8s-Terraform/
    ```

    ![Screenshot 2024-02-29 160259](https://github.com/safuvanh/DevOps-Projects/assets/156053146/5bf49035-d19a-4bdd-9d90-97ff4ae8e4fa)


3. Configure Terraform:

   ```
   cd AWS-EKS-Terraform
   vim backend.tf
   ```
   

   ![Screenshot 2024-02-29 160417](https://github.com/safuvanh/DevOps-Projects/assets/156053146/4395d070-5d2b-46e5-b2b7-56e34747bdd5)

   

   - Replace with your actual Bucket Name..if you didn't have any S3 Bucket then Create a new S3 Bucket in AWS.
     
   - In this configuration  `main.tf` , you define  cluster name, node group name, desired capacity, and max capacity

   

   
4. Create a IAM Role with AdministratorAccess Permission for EC2 

    ![Screenshot (173)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/afa11855-1f00-4c54-98de-3753de365a48)


    **Why we need IAM role for EC2** → It is used by your ec2 instance to create EKS cluster and manage s3 bucket by applying this IAM role it gives the authenticity to your ec2 to do changes in aws account

    - Attach IAM Role to Instance



5. Initialize Terraform:

    ```
    terraform init
    ```

    ![Screenshot 2024-02-29 162239](https://github.com/safuvanh/DevOps-Projects/assets/156053146/7a2a0a44-0c83-41b9-b32a-3be873e95b87)


6. Plan the deployment:

    ```
    terraform plan
    ```

    ![Screenshot (174)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/41e4c8b1-ac37-41e4-879b-e452d96c16a0)


7. Deploy Super Mario to Kubernetes:

    ```
    terraform apply --auto-approve

    ```
    ![Screenshot (175)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/15a5457b-eb27-4320-8109-2012228e9cbd)

    ![Screenshot 2024-02-29 163556](https://github.com/safuvanh/DevOps-Projects/assets/156053146/09b37000-41df-4712-a0ff-6345f358aaf6)

    ![Screenshot 2024-02-29 163729](https://github.com/safuvanh/DevOps-Projects/assets/156053146/3a1b1a03-2206-422c-bdc6-944730eb31c1)

    ```
    aws eks update-kubeconfig --name EKS_CLOUD --region ap-south-1
    ```

    ![Screenshot 2024-02-29 164551](https://github.com/safuvanh/DevOps-Projects/assets/156053146/bd117299-f71b-4810-a734-dc1d2c7b9728)



8. Navigate into K8s directory:

    ```
    cd ..
    kubectl apply -f deployment.yaml
    kubectl apply -f service.yaml
    kubectl get pods
    

    ```
    ![Screenshot 2024-02-29 164801](https://github.com/safuvanh/DevOps-Projects/assets/156053146/4ce882f2-3c01-4242-a6d7-d7ac66a8b7e4)

 9. Access Super Mario:

    - Once the deployment is complete, access the Super Mario game server using the provided endpoint.

    - Run the following command to get the load balancer ingress

    ```
    kubectl describe service mario-service
    ```
    ![Screenshot 2024-02-29 165046](https://github.com/safuvanh/DevOps-Projects/assets/156053146/b0dc135f-00f4-44aa-a394-8a86767fa26e)

      
    - Ensure to Allow HTTP and HTTPS port on your SecurityGroup 

    - Copy the load balancer ingress and paste it on browser and your game is running
   
    ![Screenshot (178)](https://github.com/safuvanh/DevOps-Projects/assets/156053146/16c575a5-56fa-4727-a817-436aaa320422)


      
   - **Load Balancer Ingress:**   It is a mechanism that helps distribute incoming internet traffic among multiple servers or services, ensuring efficient and reliable delivery of requests.a Load Balancer Ingress helps maintain a smooth user experience, improves application performance, and ensures that no single server becomes overwhelmed with too much traffic.

    
## Cleanup

To remove Super Mario deployment and associated resources from your Kubernetes cluster, run:

```
kubectl delete service mario-service
kubectl delete deployment mario-deployment
cd AWS-EKS-Terraform
terraform destroy --auto-approve

```


![Screenshot 2024-02-29 171757](https://github.com/safuvanh/DevOps-Projects/assets/156053146/051f8cbb-1f20-41a8-ad18-fc57680b1422)



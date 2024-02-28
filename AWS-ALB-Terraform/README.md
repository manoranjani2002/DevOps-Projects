# AWS Application Loadbalancer Automation - Terraform

This project demonstrates how to automate the provisioning of an AWS Application Load Balancer (ALB) along with EC2 instances using Terraform.

## Terraform
Terraform is an open-source Infrastructure as Code (IaC) tool created by HashiCorp. It allows you to define and manage your infrastructure as code, enabling you to provision and manage resources across various cloud providers and service providers in a declarative manner. it is used primarily by DevOps teams to automate various infrastructure tasks. The provisioning of cloud resources, for instance, is one of the main use cases of Terraform
### Key Features:

- **Infrastructure as Code (IaC)**: Terraform enables the definition of infrastructure in configuration files, treating infrastructure as code.
- **Declarative Syntax**: Users specify the desired state of their infrastructure in configuration files, and Terraform ensures that the actual infrastructure matches this state.
- **Provider Model**: Terraform supports a wide variety of providers, including major cloud providers like AWS, Azure, and Google Cloud Platform, as well as other services such as Kubernetes, GitHub, and more.
- **State Management**: Terraform keeps track of the state of the infrastructure it manages, allowing it to plan and execute changes incrementally.
- **Execution Plans**: Before making any changes, Terraform generates an execution plan that previews what will happen when the changes are applied.
- **Idempotent Operations**: Terraform applies changes in a safe and predictable manner, ensuring that running the same configuration multiple times has the same effect as running it once.
- **Collaboration and Automation**: Terraform configurations can be versioned, shared, and automated using version control systems like Git and CI/CD pipelines.
  
## Example

Here's a simple example of a Terraform configuration that provisions an AWS EC2 instance:

```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
}
```


## Overview

In modern cloud infrastructures, automating the deployment of load balancers is crucial for scalability, reliability, and efficiency. This project showcases the automation of setting up an AWS Application Load Balancer along with EC2 instances using Terraform, an Infrastructure as Code tool.

## Features

- Automates the provisioning of EC2 instances with a simple web server behind an Application Load Balancer.
- Allows customization of instance count, instance type, AMI ID, target group settings, and more through Terraform variables.
- Simplifies infrastructure management and provisioning, making it easy to deploy and maintain.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account with appropriate permissions to create resources.
- Terraform installed on your local machine. You can download it from [Terraform's official website](https://www.terraform.io/downloads.html).
- AWS access key ID and secret access key with permissions to create and manage EC2 instances, load balancers, and related resources.

## Configuration

### Variables

The configuration uses several variables to customize the setup according to your requirements. You can find these variables in the `variables.tf` file. Modify these variables as needed before deploying the infrastructure.

### Deployment

To deploy the infrastructure:

1. Clone this repository to your local machine.
2. Navigate to the project directory.
   
### 3. Initialize Terraform by running `terraform init`.

   
![Screenshot (158)](https://github.com/safuvanh/DevOps_projects/assets/156053146/50e8dba0-dabd-4836-a85e-cc205b94b3d2)


### 4. Review the execution plan by running `terraform plan`.


![Screenshot (160)](https://github.com/safuvanh/DevOps_projects/assets/156053146/f11cd95c-370c-4074-9a37-227d0803e688)


### 5. If the plan looks good, apply the changes by running  `terraform apply`.
### 6. Confirm the changes when prompted by entering `yes`.



![Screenshot (163)](https://github.com/safuvanh/DevOps_projects/assets/156053146/dc17ddfc-0343-4467-9b34-90af520a218f)



## Output

After successfully deploying the infrastructure using Terraform, you can expect the following outputs:

- **Load Balancer DNS Name**: The DNS name of the Application Load Balancer (ALB) that distributes incoming traffic to the EC2 instances.
- **EC2 Instance IDs**: The unique identifiers for the EC2 instances launched as part of the infrastructure.
- **Public IPs of EC2 Instances**: The public IP addresses assigned to the EC2 instances for accessing the web servers.

You can use these outputs to interact with and monitor your deployed infrastructure. To retrieve the outputs after Terraform applies the changes, you can use the `terraform output` command.

Example:

```bash
terraform output load_balancer_dns_name

```

![Screenshot (164)](https://github.com/safuvanh/DevOps_projects/assets/156053146/acf118c3-50f5-4fee-aff5-d3095a187e89)




![Screenshot (165)](https://github.com/safuvanh/DevOps_projects/assets/156053146/46d52a26-4753-47f7-8c41-128ccad367a5)



![Screenshot (166)](https://github.com/safuvanh/DevOps_projects/assets/156053146/843dfe1c-2660-47fe-8eac-83752c770ba1)



![Screenshot (167)](https://github.com/safuvanh/DevOps_projects/assets/156053146/3aad8d41-07bc-4840-b0ed-ce1cc747fb67)






## Customization

You can customize various aspects of the infrastructure by modifying the Terraform variables. Here are some common customizations you might consider:

- Changing the instance type or count.
- Using a different AMI for the EC2 instances.
- Adjusting the target group settings.
- Configuring different subnets for the ALB.
- Enabling deletion protection for the ALB.

## Cleanup

To avoid incurring unnecessary charges, remember to destroy the resources once you're done experimenting. You can do this by running `terraform destroy` and confirming the action when prompted.

![Screenshot (170)](https://github.com/safuvanh/DevOps_projects/assets/156053146/fc5df769-50bf-4cbe-ad41-1b231d28af94)


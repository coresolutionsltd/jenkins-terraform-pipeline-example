[![alt text](https://coresolutions.ltd/media/core-solutions-82.png "Core Solutions")](https://coresolutions.ltd)

[![maintained by Core Solutions](https://img.shields.io/badge/maintained%20by-coresolutions.ltd-00607c.svg)](https://coresolutions.ltd)
[![GitHub tag](https://img.shields.io/github/v/tag/coresolutions-ltd/jenkins-terraform-pipeline.svg?label=latest)](https://github.com/coresolutions-ltd/jenkins-terraform-pipeline/releases)
[![Terraform Version](https://img.shields.io/badge/terraform-~%3E%200.12-623ce4.svg)](https://github.com/hashicorp/terraform/releases)
[![License](https://img.shields.io/badge/License-Apache%202.0-brightgreen.svg)](https://opensource.org/licenses/Apache-2.0)

# Jenkins Terraform Pipeline Example
The Jenkins pipeline used in this repo composes of various stages used to initialise, plan, approve and apply terraform configurations, it's intended to be used as a starting point to pipeline terraform in a clean and efficient way.

## Jenkins Dependencies
- Setup with AWS authentication
>for simplicity I have stored AWS credentials in Jenkins as secret text values    
- Terraform 12 installed and working

## Setup
- In order to make config changes you'll first need to fork this repo, then complete the following:     
- Update the [BACKEND_BUCKET](https://github.com/coresolutions-ltd/jenkins-terraform-pipeline/blob/master/Jenkinsfile#L8) value with the correct value for your environment
- Create a new Jenkins pipeline using the location of your forked repo   
- Create a DynamoDB table for state locking defined as **terraform-state-lock**
>You can use the *Terraform/Setup* configuration to create a test S3 backend bucket / Dynamo table if needed, if you'd prefer to use existing infrastructure just update the values in the [Jenkinsfile](https://github.com/coresolutions-ltd/jenkins-terraform-pipeline/blob/master/Jenkinsfile#L8) & [terraform.tf](https://github.com/coresolutions-ltd/jenkins-terraform-pipeline/blob/master/Terraform/Demo/terraform.tf#L4) accordingly

## Usage
Running the pipeline will create everything in the Demo directory, it will pause for manual approval before applying, this allows you to review the output of the plan stage before proceeding.      

There is a single parameter which controls what action to take on the terraform infrastructure

| Parameter |           Options        |                    Description                     | 
| ---------- | ------------------------ | -------------------------------------------------- |
| Action     | **build** or **destroy** | The action to take on the terraform infrastructure |

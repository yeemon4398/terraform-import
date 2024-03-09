# Make existing AWS resources to be managed by Terraform #
## Mini Network Infrastructure ##
![YeeMon's Architectures-mini-network-infra](https://github.com/yeemon4398/terraform-import/assets/40330106/82626098-d7d6-4428-8df5-18ab2af9e712)

## Workflow Summary ##
![YeeMon's Architectures-workflow-summary](https://github.com/yeemon4398/terraform-import/assets/40330106/94deb024-e235-4925-b767-6580816f5b5a)
<br>

## Preparation ##
### Included platforms and services ###
- AWS Account
- AWS CLI
- AWS Cloud Services
- Terraform CLI
<br>

### Pre-requisites ###
- AWS account [https://signin.aws.amazon.com/]
  - IAM user with related policy > Security credentials > Create access key
- AWS CLI installation [https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html]
  - Configure profile at AWS CLI [https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html]
- Terraform CLI installation [https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli]
<br>

### Create a mini network infra using AWS CloudFormation (Can also create manually from the console) ###
#### My mini network infra reference link ####
- [mini-network-infra-cloudformation.yaml](https://github.com/yeemon4398/terraform-import/blob/main/mini-network-infra-cloudformation.yaml)
<br>

#### Create AWS CloudFormation stack to create AWS resources ####
```aws cloudformation create-stack --stack-name=<preferred_stack_name> --template-body=file://<your_cloudformation_file_name> --region=<preferred_region> --profile=<aws_cli_profile_name> ```

Need to replace some values based on your side:
-  ```<preferred_stack_name>``` - can replace your preferred name for AWS CloudFormation stack name
-  ```<your_cloudformation_file_name>``` - replace with your created AWS CloudFormation template file name
-  ```<preferred_region>``` - can replace your desired region name and need to match with availability zones in the AWS CloudFormation template
-  ```<aws_cli_profile_name>``` - replace with your created AWS CLI profile name
<br>

#### Verify resources on AWS ####
##### AWS CloudFormation Stack #####
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/ad3c9663-c705-4e28-a52a-4006ec879d0e)
<br>

##### AWS VPC and other related resources #####
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/4f323f62-d662-4f50-9586-f87cdec12d89)
<br>

## Workflow Details ##
### Explore existing resources ###
- Check each existing resource and explore each configuration
<br>

### Prepare Terraform configuration files mapping with existing resources ###
Reference link: [terraform-config-files](https://github.com/yeemon4398/terraform-import/tree/main/terraform-config-files)
<br>
<br>
### Initialize Terraform ###
Command: ```terraform init```
<br>
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/aac711e3-23d3-4e77-85b1-642524a358d2)
<br>

### Import each resource to be managed by Terraform ###
Command: ```terraform import <resource_name>.<logical_name> <actual_resource_ID>```
<br>

#### VPC ####
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/54da7cdc-aeea-45f8-bb6e-f1124044b405)
<br>

#### Internet Gateway ####
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/3d6e431e-af8f-4829-ba98-3334e6c1a941)
<br>

#### Subnets ####
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/8b5fa614-2a4d-421c-ab06-ef9de8faccdb)
<br>

![image](https://github.com/yeemon4398/terraform-import/assets/40330106/2022b87e-4589-4cfa-9f0a-5272d2c2bc2c)
<br>

#### Route Table ####
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/c866d8c5-06c0-4743-a7a9-ae07a3de6745)
<br>

## Verification ##
### Change something at the Terraform configuration file and test ###
#### Add a tag and apply changes ####
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/94b85872-5cf1-469e-8042-e7daa915eca8)
<br>
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/b6e234f7-41bd-48b2-a850-a61f44c4202e)
<br>
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/5a648ab8-8c2e-4856-801a-2ead7695fbfd)
<br>
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/2344bbcb-e297-4486-b712-baa632ea0844)
<br>

### Verify on AWS ###
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/3de94709-e1e7-4c84-b7b4-acdc31b684f4)
<br>

### terraform destroy and verify ###
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/8b2b62ba-3992-4e9d-b976-cee427e4c79a)
<br>
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/b6ec78c0-2c19-4af3-9f6a-3d42db8887ed)

### Verify on AWS ###
- We can see that the AWS CloudFormation stack will still exist but resources are now managed by Terraform and destroyed.

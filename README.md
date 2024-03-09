# Make existing AWS resources to be managed by Terraform #
## Architecture ##
![YeeMon's Architectures-mini-network-infra](https://github.com/yeemon4398/terraform-import/assets/40330106/82626098-d7d6-4428-8df5-18ab2af9e712)

## Workflow Summary ##


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

### Create a mini network infra using AWS CloudFormation (Can create manually from the console also) ###
#### My mini network infra reference link ####
- [mini-network-infra-cloudformation.yaml](https://github.com/yeemon4398/terraform-import/blob/main/mini-network-infra-cloudformation.yaml)
<br>

#### Create AWS CloudFormation stack to create AWS resources ####
- Command: aws cloudformation create-stack --stack-name=<preferred_stack_name> --template-body=file://<your_cloudformation_file_name> --region=<preferred_region> --profile=<aws_cli_profile_name> 
- Need to replace some values based on your side:
  -  <preferred_stack_name> - can replace your preferred name for AWS CloudFormation stack name
  -  <your_cloudformation_file_name> - replace with your created AWS CloudFormation template file name
  -  <preferred_region> - can replace your desired region name and need to match with availability zones in the AWS CloudFormation template
  -  <aws_cli_profile_name> - replace with your created AWS CLI profile name
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

### Prepare Terraform configuration files based on existing resources ###
#### My Terraform configuration files ####
- [terraform-config-files](https://github.com/yeemon4398/terraform-import/tree/main/terraform-config-files)

### Initialize Terraform ###
- Command: terraform init
<br>
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/aac711e3-23d3-4e77-85b1-642524a358d2)
<br>

### Import each resource to be managed by Terraform ###
- Command: terraform import <resource_name>.<logical_name> <actual_resource_ID>
<br>

#### VPC ###
![image](https://github.com/yeemon4398/terraform-import/assets/40330106/54da7cdc-aeea-45f8-bb6e-f1124044b405)
<br>






# AWS VPC Setup with Terraform

This repository contains Terraform configurations to set up an AWS VPC with public and private subnets. The public subnet is associated with an Internet Gateway.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- AWS account with appropriate permissions to create VPCs, subnets, gateways, and route tables
- AWS CLI configured with your credentials

## Resources Created

- VPC with CIDR block `10.0.0.0/16`
- Public subnet with CIDR block `10.0.2.0/24`
- Private subnet with CIDR block `10.0.1.0/24`
- Internet Gateway
- Route tables for public and private subnets
- Route table associations

## Usage

1. Clone the repository:

   ```sh
   git clone https://github.com/YOUR_GITHUB_USERNAME/aws-vpc-terraform.git
   cd aws-vpc-terraform
   ```

2. Initialize Terraform:

   ```sh
   terraform init
   ```

3. Review the execution plan:

   ```sh
   terraform plan
   ```

4. Apply the configuration:

   ```sh
   terraform apply
   ```

   Type `yes` when prompted to confirm the operation.

5. Destroy the infrastructure when no longer needed:

   ```sh
   terraform destroy
   ```

   Type `yes` when prompted to confirm the operation.

## Configuration Details

- **VPC:** A virtual private cloud with a CIDR block of `10.0.0.0/16`.
- **Public Subnet:** A subnet with a CIDR block of `10.0.2.0/24` that routes traffic to the Internet Gateway.
- **Private Subnet:** A subnet with a CIDR block of `10.0.1.0/24`.
- **Internet Gateway:** Allows instances in the public subnet to access the internet.
- **Route Tables:** Separate route tables for public and private subnets with appropriate routes configured.
- **Route Table Associations:** Associates the public subnet with the public route table and the private subnet with the private route table.


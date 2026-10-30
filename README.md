# Jenkins on AWS EC2 with Terraform

This stack calls the local VPC module and the local `ec2/` module. The EC2
module launches an Ubuntu 24.04 instance in the first public subnet and
installs Jenkins LTS, Java 21, Python 3, pip, Git, and Docker with cloud-init.
The security group allows SSH (port 22) and the Jenkins UI (port 8080) only from
the configured trusted CIDR.

## Resource count

The main stack declares **29 Terraform-managed AWS resource instances**:

| Component | Count | Includes |
|---|---:|---|
| VPC module | 19 | 1 VPC, 6 subnets, 2 route tables, 6 route table associations, 1 internet gateway, 1 NAT gateway, 1 NAT Elastic IP, and 1 security group |
| EKS module | 8 | 1 EKS cluster, 1 managed node group, 2 IAM roles, and 4 IAM policy attachments |
| Jenkins EC2 module | 2 | 1 EC2 instance and 1 security group |
| **Total** | **29** | Terraform-managed resource instances in this stack |

The EKS node group is configured for two desired worker nodes. AWS creates and
manages those EC2 worker instances through the node group, so they are not
separate Terraform resource blocks in this count. The `s3-state-flie/` folder
is a separate stack; applying it creates 4 additional S3-related resources.

## Deploy

### 1. Create the S3 state bucket

Choose a globally unique bucket name. Put the same name in
`backend.hcl` (`bucket`) and `s3-state-flie/terraform.tfvars`
(`state_bucket_name`). Then bootstrap the bucket using local state:

```powershell
cd C:\Users\mdtal\work\porjects\terraform-master\s3-state-flie
terraform init
terraform plan
terraform apply
```

The bucket has versioning, server-side encryption, and public access blocking.
Keep the local state file in this bootstrap directory secure; the bucket stack
manages the bucket that stores the main stack's state.

### 2. Initialize the main stack with the S3 backend

```powershell
cd C:\Users\mdtal\work\porjects\terraform-master
terraform init -backend-config=backend.hcl -migrate-state
```

Terraform will migrate any existing local state to S3. Keep the same backend
configuration for future `plan`, `apply`, and `destroy` commands.

### 3. Deploy the VPC, EKS, and Jenkins resources

Edit `terraform.tfvars` first. Set `allowed_admin_cidr` to your public IP with
`/32` and `key_name` to an existing EC2 key pair. Then run:

```powershell
terraform plan
terraform apply
```

Terraform automatically loads `terraform.tfvars` from this directory. The
included values for `allowed_admin_cidr` and `key_name` are examples and must
be replaced before planning.

After deployment, open the `jenkins_url` Terraform output from the allowed
network. Use the initial admin password command shown by Terraform over SSH,
then complete Jenkins setup in the browser.

The VPC module creates a NAT gateway, which incurs charges in addition to the
EC2 instance and EBS volume. Run `terraform destroy` when you no longer need
the environment. Preserve the S3 state bucket and its object versions while
Terraform still needs this backend.

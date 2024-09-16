# Terraform AWS IAM role module

This module creates the necessary AWS IAM role and its applicable permissions policies. It will return the IAM role ARN which has to be manually entered in the Uptycs console as part of the service integration process.
The following policies will be attached to this IAM role:

- AWS managed: arn:aws:iam::aws:policy/job-function/ViewOnlyAccess
- AWS managed: arn:aws:iam::aws:policy/SecurityAudit
- Customer managed:

  - `arn:aws:iam::<Customer-Account-ID>:policy/cloudquery-ReadOnlyPolicy`

&nbsp;
# Prerequisites

- Minimum required version of Terraform -> v0.12.31
- The IAM user or IAM role you use to execute the Terraform script should have the policy `arn:aws:iam::aws:policy/AdministratorAccess` attached.


&nbsp;
# Running the Terraform script

- Create a file with name `main.tf` and paste the code given below into it.

```
module "aws-account-cspm" {
  source                    = "../../../modules/cspm_integration/accounts"

  integration_prefix = "uptycs-account-1"
  upt_account_id = "012345678912"
  external_id = "abc"
}

```
- Modify the ‘Input’ details as needed
- Uptycs Account ID and External ID must be copied from the Uptycs UI.
&nbsp;

  ![](assets/uptycs-web.png)

&nbsp;
## Inputs

| Name                      | Description                                                           | Type     | Required | Default      |
| --------------------------- | ----------------------------------------------------------------------- | ---------- | ---------- | -------------- |
| integration_prefix           | Prefix to be used for naming new resources                            | `string` |    Yes      | |
| upt_account_id            | Uptycs AWS account ID. Copy the AWS Account ID from Uptycs' UI        | `string` | Yes      |              |
| external_id               | Role external ID provided by Uptycs. Copy the UUID ID from Uptycs' UI | `string` | Yes      |              |
| tags                      | Tags to apply to the resources created by this module                 | `map`    |          | `{}`         |
| permissions_boundary_policy_arn | Policy ARNs used to set permission boundary | `string` | `""`  | Optional |


# Set Region  and profile before executing terraform

```sh
export AWS_PROFILE="< profile name >"
export AWS_DEFAULT_REGION="<region-code>"
```
&nbsp;
# Execute Terraform script to get the role ARN

```sh
$ terraform init -upgrade
$ terraform plan
$ terraform apply
```


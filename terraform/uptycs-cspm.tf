locals {
  UptycsCSPMaccounts = [
    {
      accountName       = "cloudquery-root-management"
      integrationPrefix = "debug-11"
      externalId        = "012e935c-45a7-5c63-936d-924967513211"
    },
    {
      accountName       = "cqmanagement-account-1"
      integrationPrefix = "debug-22"
      externalId        = "012e935c-45a7-5c63-936d-924967513222"
    },
    {
      accountName       = "cqmanagement-account-2"
      integrationPrefix = "debug-33"
      externalId        = "012e935c-45a7-5c63-936d-924967513233"
    },
    {
      accountName       = "childaccount2"
      integrationPrefix = "debug-44"
      externalId        = "012e935c-45a7-5c63-936d-924967513244"
    },
    {
      accountName       = "childaccount3"
      integrationPrefix = "debug-55"
      externalId        = "012e935c-45a7-5c63-936d-924967513255"
    }
  ]
}

provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  for_each = { for account in local.UptycsCSPMaccounts : account.accountName => account }
  
  alias = each.value.integrationPrefix
  region = "us-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::${each.value.accountName}:role/AFTExecutionRole"
    external_id  = each.value.externalId
  }
}

module "uptycs_aws_cspm" {
  source = "https://uptycs-terraform-dev.s3.amazonaws.com/terraform-aws-uptycs.zip//modules/cspm_integration/accounts"

  for_each = { for account in local.UptycsCSPMaccounts : account.accountName => account }

  providers = {
    aws = aws[each.value.integrationPrefix]
  }

  upt_account_id     = "685272795239"
  integration_prefix = each.value.integrationPrefix
  external_id        = each.value.externalId
}

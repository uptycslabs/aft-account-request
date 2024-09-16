locals {
    accounts = [
        {
            accountName               = "cqmanagement-account-1"
            accountEmail              = "aws-qa+cloudquery-cqmanagement-account-1@uptycs.com"
            managedOrganizationalUnit = "AdditionalOU"
        },
        {
            accountName               = "cqmanagement-account-2"
            accountEmail              = "aws-qa+cloudquery-cqmanagement-account-2@uptycs.com"
            managedOrganizationalUnit = "QA-testing"
        },
        {
            accountName               = "childaccount2"
            accountEmail              = "hpawar+2@uptycs.com"
            managedOrganizationalUnit = "QA-testing"
        },
        {
            accountName               = "childaccount3"
            accountEmail              = "hpawar+3@uptycs.com"
            managedOrganizationalUnit = "QA-OU2"
        },
        {
            accountName               = "cloudquery-root-management"
            accountEmail              = "aws-qa+cloudquery-root-management@uptycs.com"
            managedOrganizationalUnit = "Root"
        }
    ]
}

module "aft_import_accounts" {
  source = "./modules/aft-account-request"

  for_each = { for account in local.accounts : account.accountName => account }

  control_tower_parameters = {
    AccountName               = each.value.accountName
    AccountEmail              = each.value.accountEmail
    ManagedOrganizationalUnit = each.value.managedOrganizationalUnit
    SSOUserEmail              = "gkondisetty@uptycs.com"
    SSOUserFirstName          = "Giri"
    SSOUserLastName           = "Kondisetty"
  }

  account_tags = { "Sandbox" = "${each.value.accountName}" }

  change_management_parameters = {
    change_requested_by = "gkondisetty@uptycs.com"
    change_reason       = "Import ${each.value.accountName} in AFT"
  }

  custom_fields = {
    group = "sandbox"
  }

  account_customizations_name = "sandbox"
}

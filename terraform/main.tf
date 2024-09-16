locals {
    accounts = [
        {
            accountId                 = "924967513276"
            accountName               = "cqmanagement-account-1"
            accountEmail              = "aws-qa+cloudquery-cqmanagement-account-1@uptycs.com"
            managedOrganizationalUnit = "AdditionalOU"
            ssoUserEmail              = "gkondisetty@uptycs.com"
            ssoUserFirstName          = "Giri"
            ssoUserLastName           = "Kondisetty"
            accountTags               = { "Sandbox" = "cqmanagement-account-1 - 924967513276" }
            changeRequestedBy         = "gkondisetty@uptycs.com"
            changeReason              = "Import cqmanagement-account-1 in AFT"
            customFieldsGroup         = "sandbox"
            accountCustomizationsName = "sandbox"
        },
        {
            accountId                 = "496028668001"
            accountName               = "cqmanagement-account-2"
            accountEmail              = "aws-qa+cloudquery-cqmanagement-account-2@uptycs.com"
            managedOrganizationalUnit = "QA-testing"
            ssoUserEmail              = "gkondisetty@uptycs.com"
            ssoUserFirstName          = "Giri"
            ssoUserLastName           = "Kondisetty"
            accountTags               = { "Sandbox" = "cqmanagement-account-2 - 496028668001" }
            changeRequestedBy         = "gkondisetty@uptycs.com"
            changeReason              = "Import cqmanagement-account-2 in AFT"
            customFieldsGroup         = "sandbox"
            accountCustomizationsName = "sandbox"
        },
        {
            accountId                 = "912326510691"
            accountName               = "childaccount2"
            accountEmail              = "hpawar+2@uptycs.com"
            managedOrganizationalUnit = "QA-testing"
            ssoUserEmail              = "gkondisetty@uptycs.com"
            ssoUserFirstName          = "Giri"
            ssoUserLastName           = "Kondisetty"
            accountTags               = { "Sandbox" = "childaccount2 - 912326510691" }
            changeRequestedBy         = "gkondisetty@uptycs.com"
            changeReason              = "Import childaccount2 in AFT"
            customFieldsGroup         = "sandbox"
            accountCustomizationsName = "sandbox"
        },
        {
            accountId                 = "051315720372"
            accountName               = "childaccount3"
            accountEmail              = "hpawar+3@uptycs.com"
            managedOrganizationalUnit = "QA-OU2"
            ssoUserEmail              = "gkondisetty@uptycs.com"
            ssoUserFirstName          = "Giri"
            ssoUserLastName           = "Kondisetty"
            accountTags               = { "Sandbox" = "childaccount3 - 051315720372" }
            changeRequestedBy         = "gkondisetty@uptycs.com"
            changeReason              = "Import childaccount3 in AFT"
            customFieldsGroup         = "sandbox"
            accountCustomizationsName = "sandbox"
        },
        {
            accountId                 = "646602658615"
            accountName               = "cloudquery-root-management"
            accountEmail              = "aws-qa+cloudquery-root-management@uptycs.com"
            managedOrganizationalUnit = "Root"
            ssoUserEmail              = "gkondisetty@uptycs.com"
            ssoUserFirstName          = "Giri"
            ssoUserLastName           = "Kondisetty"
            accountTags               = { "Sandbox" = "cloudquery-root-management - 646602658615" }
            changeRequestedBy         = "gkondisetty@uptycs.com"
            changeReason              = "Import cloudquery-root-management in AFT"
            customFieldsGroup         = "sandbox"
            accountCustomizationsName = "sandbox"
        }
    ]
}

module "aft_import_accounts" {
  source = "./modules/aft-account-request"

  for_each = { for account in local.accounts : account.accountName => account }

  control_tower_parameters = {
    AccountEmail              = each.value.accountEmail
    AccountName               = each.value.accountName
    ManagedOrganizationalUnit = each.value.managedOrganizationalUnit
    SSOUserEmail              = each.value.ssoUserEmail
    SSOUserFirstName          = each.value.ssoUserFirstName
    SSOUserLastName           = each.value.ssoUserLastName
  }

  account_tags = each.value.accountTags

  change_management_parameters = {
    change_requested_by = each.value.changeRequestedBy
    change_reason       = each.value.changeReason
  }

  custom_fields = {
    group = each.value.customFieldsGroup
  }

  account_customizations_name = each.value.accountCustomizationsName
}

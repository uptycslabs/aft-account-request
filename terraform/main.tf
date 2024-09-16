module "aft-import-sandbox" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "aws-qa+cloudquery-cqmanagement-account-2@uptycs.com"
    AccountName               = "cqmanagement-account-2"
    ManagedOrganizationalUnit = "QA-testing"
    SSOUserEmail              = "gkondisetty@uptycs.com"
    SSOUserFirstName          = "Giri"
    SSOUserLastName           = "Kondisetty"
  }

  account_tags = {
    "Sandbox" = "Sandbox-01"
  }

  change_management_parameters = {
    change_requested_by = "Account_Infra"
    change_reason       = "Import a Sandbox account in AFT"
  }

  custom_fields = {
    group = "sandbox"
  }

  account_customizations_name = "sandbox"
}

module "aft-import-sandbox" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "hpawar+2@uptycs.com"
    AccountName               = "childaccount2"
    ManagedOrganizationalUnit = "QA-testing"
    SSOUserEmail              = "gkondisetty@uptycs.com"
    SSOUserFirstName          = "Giri"
    SSOUserLastName           = "Kondisetty"
  }

  account_tags = {
    "Sandbox" = "AFT-Managed"
  }

  change_management_parameters = {
    change_requested_by = "Account_Infra by Uptycs"
    change_reason       = "Import account in AFT"
  }

  custom_fields = {
    group = "sandbox"
  }

  account_customizations_name = "childaccount2"
}

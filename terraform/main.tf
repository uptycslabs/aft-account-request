module "sandbox02" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "adipurush.aws+sandbox2@gmail.com"
    AccountName               = "sandbox02-aft"
    ManagedOrganizationalUnit = "Sample sandbox"
    SSOUserEmail              = "adipurush.aws@gmail.com"
    SSOUserFirstName          = "Sandbox02"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "Learn Tutorial" = "AFT"
    "type"           = "Sandbox02"
  }

  change_management_parameters = {
    change_requested_by = "Me"
    change_reason       = "Adding a sample account to see"
  }

  custom_fields = {
    group = "non-prod"
  }

  account_customizations_name = "sandbox"
}

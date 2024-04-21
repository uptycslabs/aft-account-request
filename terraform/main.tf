

module "sandbox03-aft" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "adipurush.aws+sandbox03@gmail.com"
    AccountName               = "sandbox03-aft"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "adipurush.aws+sandbox03@gmail.com"
    SSOUserFirstName          = "sandbox03"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "Learn Tutorial" = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "sandbox03-aft"
    change_reason       = "Agent based AFT account creation"
  }
}



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


module "sandbox04-aft" {
  source = "./modules/aft-account-request"

  control_tower_parameters = {
    AccountEmail              = "adipurush.aws+sandbox04@gmail.com"
    AccountName               = "sandbox04-aft"
    ManagedOrganizationalUnit = "Sandbox"
    SSOUserEmail              = "adipurush.aws+sandbox04@gmail.com"
    SSOUserFirstName          = "Sandbox04"
    SSOUserLastName           = "AFT"
  }

  account_tags = {
    "Learn Tutorial" = "AFT"
  }

  change_management_parameters = {
    change_requested_by = "sandbox04-aft"
    change_reason       = "Agent based AFT account creation"
  }
}

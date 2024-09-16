locals {
    accounts = [
        {
            accountId                 = "924967513276"
            accountName               = "cqmanagement-account-1"
            integrationPrefix         = "Debug-cqmanagement"
            externalId                = "012e935c-45a7-5c63-936d-924967513276"
        },
        {
            accountId                 = "496028668001"
            accountName               = "cqmanagement-account-2"
            integrationPrefix         = "Debug-cqmanagement"
            externalId                = "012e935c-45a7-5c63-936d-496028668001"
        },
        {
            accountId                 = "912326510691"
            accountName               = "childaccount2"
            integrationPrefix         = "Debug-childaccount2"
            externalId                = "012e935c-45a7-5c63-936d-912326510691"
        },
        {
            accountId                 = "051315720372"
            accountName               = "childaccount3"
            integrationPrefix         = "Debug-childaccount3"
            externalId                = "012e935c-45a7-5c63-936d-051315720372"
        }
    ]
}

module "uptycs_aws_cspm" {
    source             = "./modules/cspm_integration/accounts"
    
    for_each = { for account in local.accounts : account.accountName => account }

    upt_account_id     = "685272795239"
    integration_prefix = each.value.integrationPrefix
    external_id        = each.value.externalId

    account_customizations_name = "sandbox"
}

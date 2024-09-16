output "customization_name" {
  value = var.account_customizations_name
}

resource "aws_iam_role" "custom_role" {
  name = var.account_customizations_name  # Use customizations name here
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}
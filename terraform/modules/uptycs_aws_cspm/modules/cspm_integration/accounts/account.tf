resource "aws_iam_role" "role" {
  name = "${var.integration_prefix}"
  path = "/"

  assume_role_policy = <<EOF
{
	"Version": "2012-10-17",
	"Statement": [{
		"Action": "sts:AssumeRole",
		"Principal": {
			"AWS": "${var.upt_account_id}"
		},
		"Condition": {
			"StringEquals": {
				"sts:ExternalId": "${var.external_id}"
			}
		},
		"Effect": "Allow",
		"Sid": ""
	}]
}
EOF
  permissions_boundary = var.permissions_boundary_policy_arn

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "viewaccesspolicy_attach" {
  policy_arn = "arn:aws:iam::aws:policy/job-function/ViewOnlyAccess"
  role       = aws_iam_role.role.name

}

resource "aws_iam_role_policy_attachment" "securityauditpolicy_attach" {
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
  role       = aws_iam_role.role.name

}

resource "aws_iam_role_policy_attachment" "ReadOnlyPolicy_attach" {
  policy_arn = aws_iam_policy.ReadOnlyPolicy.arn
  role       = aws_iam_role.role.name

}

resource "aws_iam_policy" "ReadOnlyPolicy" {
  name        = "${var.integration_prefix}-ReadOnlyPolicy"
  description = "Given Read Only policy Access to service."
  policy      = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "aoss:BatchGet*",
              "aoss:Get*",
              "aoss:List*",
              "apigateway:GET",
              "bedrock:Get*",
              "bedrock:List*",
              "ce:GetCostAndUsage",
              "codecommit:GetCommit",
              "codepipeline:ListTagsForResource",
              "ds:ListTagsForResource",
              "ec2:SearchTransitGatewayRoutes",
              "eks:DescribeAddon",
              "eks:DescribeFargateProfile",
              "eks:DescribeIdentityProviderConfig",
              "eks:DescribeNodegroup",
              "eks:DescribeUpdate",
              "eks:ListAddons",
              "eks:ListFargateProfiles",
              "eks:ListIdentityProviderConfigs",
              "eks:ListNodegroups",
              "eks:ListTagsForResource",
              "eks:ListUpdates",
              "elasticfilesystem:DescribeFileSystemPolicy",
              "glacier:DescribeJob",
              "glacier:GetDataRetrievalPolicy",
              "glacier:GetJobOutput",
              "glacier:GetVaultNotifications",
              "glacier:ListJobs",
              "glacier:ListTagsForVault",
              "lambda:GetCodeSigningConfig",
              "lambda:GetFunctionCodeSigningConfig",
              "logs:FilterLogEvents",
              "macie2:Describe*",
              "macie2:Get*",
              "macie2:List*",
              "ram:GetResourceShares",
              "ram:ListResources",
              "redshift-serverless:List*",
              "s3:GetIntelligentTieringConfiguration",
              "servicecatalog:DescribePortfolio",
              "servicecatalog:DescribeProductAsAdmin",
              "servicecatalog:DescribeProvisioningArtifact",
              "servicecatalog:DescribeServiceAction",
              "servicecatalog:SearchProductsAsAdmin",
              "sns:GetSubscriptionAttributes",
              "ssm:ListCommandInvocations"
            ],
            "Resource": "*"
        }
    ]
}
EOF

  tags = var.tags
}


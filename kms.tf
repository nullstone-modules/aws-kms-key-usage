data "aws_iam_policy_document" "this" {
  statement {
    sid    = "AllowKmsUsage"
    effect = "Allow"

    actions = [
      "kms:Decrypt",
      "kms:DescribeKey",
    ]

    resources = [var.kms_key_arn]
  }
}

resource "aws_iam_policy" "this" {
  name   = "kms-${local.resource_name}"
  policy = data.aws_iam_policy_document.this.json
}

resource "aws_iam_role_policy_attachment" "app" {
  role       = local.role_name
  policy_arn = aws_iam_policy.this.arn
}

resource "aws_iam_role_policy_attachment" "execution" {
  role       = local.execution_role_name
  policy_arn = aws_iam_policy.this.arn
}

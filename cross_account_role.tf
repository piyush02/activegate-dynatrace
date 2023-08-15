data "aws_iam_policy_document" "cross_account_assume_role_policy" {
  statement {
    sid     = "AllowAssumeRoleForAnotherAccount"
    actions = ["sts:AssumeRole"]
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = [
        "arn:aws:iam::${var.account_id}:root",
        "arn:aws:iam::${var.my_account_id}:role/${var.dynatrace_activeGate_role}",
      ]
    }
    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [var.external_id]
    }
  }
}



resource "aws_iam_role" "cross_account_assume_role" {
  name               = var.name
  assume_role_policy = data.aws_iam_policy_document.cross_account_assume_role_policy.json
}

/* resource "aws_iam_role_policy_attachment" "cross_account_assume_role" {
  count = length(var.policy_arns)

  role       = aws_iam_role.cross_account_assume_role.name
  policy_arn = element(var.policy_arns, count.index)
}
 */
resource "aws_iam_policy" "dynatrace_monitoring_policy" {
    name = var.monitoring_policy_name
    #name = "dynatrace_monitoring_policy"
    policy = file("dynatrace_monitoring_policy.json")
  
}


resource "aws_iam_role_policy_attachment" "dt-policy" {
  
  role       = aws_iam_role.cross_account_assume_role.name
  policy_arn = aws_iam_policy.dynatrace_monitoring_policy.id
}



/*  principals {
      type        = "AWS"
      identifiers = [aws_iam_role.dynatrace_activeGate_role.name]
    } */
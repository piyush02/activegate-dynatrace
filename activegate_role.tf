resource "aws_iam_role" "dynatrace_activeGate_role" {
 #name = "dynatrace_activeGate_role"
 name = var.dynatrace_activeGate_role
 assume_role_policy = file("ec2_assumerole_trust.json")
/*  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
 */
 }



resource "aws_iam_instance_profile" "dynatrace_instance_profile" {
  name = "dynatrace_instance_profile"
  role = aws_iam_role.dynatrace_activeGate_role.id
}

resource "aws_iam_role_policy" "dynatrace_inline_policy" {
 name = "dynatrace_inline_policy"
 role = aws_iam_role.dynatrace_activeGate_role.id
 #policy = file("Dynatrace_ActiveGate_role.json")
 policy = data.aws_iam_policy_document.my-policy1.json

}


data "aws_iam_policy_document" "my-policy1" {
  statement {
    sid = ""
    #resources = ["arn:aws:iam::861120270163:role/dynatrace_monitoring_policy"]
    resources = ["arn:aws:iam::${var.my_account_id}:role/${var.monitoring_policy_name}"]
    actions = ["sts:AssumeRole"]   
    
  }
}


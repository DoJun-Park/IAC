resource "aws_iam_role" "test-role" {
 name = "test-role"
 path = "/"
 assume_role_policy = <<EOF
{ 
  "Version": "2012-10-17",
  "Statement": [
    { 
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "test_s3_policy" {
  name   = "test-s3-policy"
  role   = aws_iam_role.test-role.id
  policy = <<EOF
{
  "Statement": [
    {
      "Sid": "AllowAppArtifactsReadAccess",
      "Action": [
        "s3:*"
      ],
      "Resource": [
        "*"
      ],
      "Effect": "Allow"
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "test-profile" {
  name = "test-profile"
  role   = aws_iam_role.test-role.id
}


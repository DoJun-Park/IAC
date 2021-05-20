resource "aws_iam_user" "dojun"{
 name = "dojun"
}

resource "aws_iam_user_policy" "dojun_policy" {
  name  = "dojun_policy"
  user  = aws_iam_user.dojun.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}

~        

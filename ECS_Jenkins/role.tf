resource "aws_iam_role" "jenkins_ecs" {
  name = "jenkins_ecs"

}

resource "aws_iam_instance_profile" "jenkins_ecs" {
  name  = "jenkins_ecs"
  role = "${aws_iam_role.jenkins_ecs_role.name}"
}

resource "aws_iam_role_policy" "jenkins_ecs_policy"
{
	name	= "jenkins_ecs_policy"
	role	= "${aws_iam_role.jenkins_ecs.id}"
 policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement":[
    {
       "Effect": "Allow"
	"Action": [
	
	]
	}	
}
}

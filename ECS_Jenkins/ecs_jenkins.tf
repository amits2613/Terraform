provider "aws"{
	region 		= "${var.region}"
	access_key	= "${var.access_key}"
	secret_key	= "${var.secret_key }"
	
}

resource "aws_ecs_cluster" "jenkins_cluster" {
	name	= "Jenkins_ecs"
}

resource "aws_ecs_service" "ecs_jenkins" {
	name		= "${aws_ecs_cluster.jenkins_cluster.id}"
	task_definition	= "${aws_ecs_task_definition.jenkins_task.arn}"
	desired_count	= 1
	iam_role	= "${aws_iam_role.jenkins_ecs.arn}"
	depends_on	= ["aws_iam_role_policy.jenkins_ecs_policy"]
}
	

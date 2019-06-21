
provider "aws" {
}
# --------------
# EFS Filesystem
# --------------
resource "aws_efs_file_system" "efs" {
  creation_token = "${var.efs_name}"
}

# -----------------
# EFS Mount targets
# -----------------
resource "aws_efs_mount_target" "efs_mount_target" {
  count           = "${data.aws_subnet.subnets_info.count}"
  file_system_id  = "${aws_efs_file_system.efs.id}"
  subnet_id       = "${data.aws_subnet_ids.subnets.ids[count.index]}"
  security_groups = ["${aws_security_group.efs_access_security_group.id}"]
}

resource "aws_security_group" "efs_access_security_group" {
  name        = "efs_acces_sg_${var.efs_name}"
  description = "Allow public facing apps to accept client request over ssh and efs"
  vpc_id    = "${data.aws_vpc.vpc.id}"
  tags      = "${merge(map("Name", var.efs_name))}"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_vpc.vpc.cidr_block}"]
  }

  ingress {
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = ["${data.aws_vpc.vpc.cidr_block}"]
  }

}

data "aws_vpc" "vpc" {
  id = "${var.vpc_id}"
}

data "aws_subnet_ids" "subnets" {
  vpc_id = "${data.aws_vpc.vpc.id}"
  tags {
    SubnetType = "Private"
  }
}

data "aws_subnet" "subnets_info" {
  count = "${length(data.aws_subnet_ids.subnets.ids)}"
  id = "${data.aws_subnet_ids.subnets.ids[count.index]}"
}

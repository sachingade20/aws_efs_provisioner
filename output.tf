output "efs-id"
{
	value = "${aws_efs_file_system.efs.id}"
}

output "efs-endpoint"
{
	value = "${aws_efs_file_system.efs.dns_name}"
}

output "efs-temp"
{
	value = "${aws_efs_file_system.efs.id}"
}

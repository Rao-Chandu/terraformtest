resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key-1"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEBLn7qy3R1zGrms095e5xImYZLZTE5EBGPaiw1T3E08klL4LnFVroDQq0mYKhwyMk5sDa+kyaePoo3B2k8AevaHgo6N94FlwjrmLSWJ64Ac739IYgwMTUcreN7lx4wKtooMyRCRO7oQ9MwepMdmV4GkRRNfkg1sMfh/oqmlQIsk3Yvl6hwKXr1eIMqKVCcQMDU/76/+IQcKbqLtWAQyI7i0XzlAnutrY0WAbvLUqcThfbJrLTMEOwrlk5gnQu/Y7u2V7NsOquz4/1fc9nsuzCgxdOuC8VafRQ+Tqxiu1JpnCncuWSHcxvhrzyZSaUSxBQzGM2K/uPNX1ImyTPf/pBbjhyYh0kqGXrVS141C4qF4efKdESt81dsMJaMjr4ecnzhIu6t4rpAN5aZhTx/21W0x6CS5tAsVtQ7/k3ffo5C2EXvnqN+mhay+YbSzasR+8DTvWB4kf7XCj+nC4IFFNQviQQlV030vMUWl8wwxkv7WKDRAu5KwMd1tVdRGShNfU= Lenovo@DESKTOP-U32R52G"
}
resource "aws_instance" "my-instance" {
	ami = "ami-08bc77a2c7eb2b1da"
	instance_type = "t2.small"
	user_data = "${file("install_apache.sh")}"
	key_name   = "deployer-key-1"
	tags = {
		Name = "Terraform"	
		Batch = "5AM"
	}
}
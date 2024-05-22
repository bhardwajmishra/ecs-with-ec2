# #instance 

resource "aws_key_pair" "bhardwaj-tf" {
  key_name   = "bhardwaj-tf1"
  public_key = file("${path.module}/id_rsa.pub")
}
resource "aws_security_group" "test" {
  name        = "allow_tls1"
  description = "Allow TLS inbound traffic"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = [22,80,443,704]
    iterator = port
    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
resource "aws_instance" "web" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = "${aws_key_pair.bhardwaj-tf.key_name}"
  vpc_security_group_ids  = ["${aws_security_group.test.id}"]
  associate_public_ip_address = true
  subnet_id                   = var.aws_subnet_main_a
  iam_instance_profile = var.ecs_instance_profile



  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    encrypted             = true
    delete_on_termination = true
  }

    user_data = <<-EOF
        #!/bin/bash -ex
        echo ECS_CLUSTER=${var.ecs_cluster_name} >> /etc/ecs/ecs.config
        EOF


  tags = {
    Name = "Terraform_instance1"
  }
}
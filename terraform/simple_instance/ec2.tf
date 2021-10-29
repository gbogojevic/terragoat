provider "aws" {
  region = "us-west-2"
}

resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    git_commit           = "85b6e139aa300aa75c8b14b8d574ff0acf6588d5"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-29 11:58:03"
    git_last_modified_by = "36695537+gbogojevic@users.noreply.github.com"
    git_modifiers        = "36695537+gbogojevic"
    git_org              = "gbogojevic"
    git_repo             = "terragoat"
    yor_trace            = "9a5b7d4e-3f36-456c-a196-afbaeb24ba3c"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "85b6e139aa300aa75c8b14b8d574ff0acf6588d5"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-29 11:58:03"
    git_last_modified_by = "36695537+gbogojevic@users.noreply.github.com"
    git_modifiers        = "36695537+gbogojevic"
    git_org              = "gbogojevic"
    git_repo             = "terragoat"
    yor_trace            = "479e7aa2-eb70-4c11-87d6-176a9e03d6a8"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

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
    git_commit           = "da9b4256e1bfbfcfa553afe5504f16d6ee83ff0a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-29 12:01:14"
    git_last_modified_by = "36695537+gbogojevic@users.noreply.github.com"
    git_modifiers        = "36695537+gbogojevic"
    git_org              = "gbogojevic"
    git_repo             = "terragoat"
    yor_trace            = "e1046b64-e47f-4a5d-bf8c-2ea9d6846714"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]
  tags = {
    Name                 = "bc_workshop_ec2"
    git_commit           = "da9b4256e1bfbfcfa553afe5504f16d6ee83ff0a"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-10-29 12:01:14"
    git_last_modified_by = "36695537+gbogojevic@users.noreply.github.com"
    git_modifiers        = "36695537+gbogojevic"
    git_org              = "gbogojevic"
    git_repo             = "terragoat"
    yor_trace            = "0da70050-7857-4a31-a5f8-6c78edaca86f"
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

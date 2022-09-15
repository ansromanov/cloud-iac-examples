locals {
  project = "devops-iac-report"
  env     = "dev"
  app     = "terraform-monolith"
  owner   = "andrei.romanov"
  prefix  = "${local.project}-${local.app}-${local.env}"

  region      = "eu-central-1"
  cidr_block  = "10.27.224.0/23"
  route53_ttl = "1000"

  instance_name = "server"

  tags = {
    Project     = local.project
    Environment = local.env
    App         = local.app
    Owner       = local.owner
    Managed_by  = "Terraform"
  }
}

resource "aws_vpc" "private" {
  cidr_block = local.cidr_block

  tags = merge(local.tags, {
    Name = local.prefix
  })
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.private.id
  cidr_block        = aws_vpc.private.cidr_block
  availability_zone = "${local.region}a"

  tags = merge(local.tags, {
    Name = local.prefix
  })
}

resource "aws_route53_zone" "private" {
  name    = "${local.env}.${local.app}.${local.project}.local"
  comment = "Private zone"
  vpc {
    vpc_id = aws_vpc.private.id
  }

  tags = local.tags
}

resource "aws_instance" "server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.private.id

  tags = merge(local.tags, {
    Name = local.instance_name
  })
}

resource "aws_route53_record" "server" {
  name    = local.instance_name
  type    = "A"
  zone_id = aws_route53_zone.private.id
  ttl     = local.route53_ttl
  records = [aws_instance.server.private_ip]
}

resource "aws_route53_record" "server_cname" {
  name    = "${local.instance_name}-cname"
  type    = "CNAME"
  zone_id = aws_route53_zone.private.id
  ttl     = local.route53_ttl
  records = [aws_instance.server.private_dns]
}

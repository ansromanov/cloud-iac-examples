environment = "dev"
vpc_cidr    = "10.27.224.0/23"

route53_zones = {
  "devops-iac2.local" = {
    type = "public"
  }
  "devops-iac3.local" = {
    type = "private"
  }
}

dns_records = {
  mu = {
    route53_zone = "devops-iac2.local"
    ip_address   = "10.27.224.1"
    ttl          = "1000"
    create_cname = true
  },
  nu = {
    route53_zone = "devops-iac2.local"
    ip_address   = "10.27.224.2"
    ttl          = "1000"
    create_cname = false
  },
  xi = {
    route53_zone = "devops-iac3.local"
    ip_address   = "10.27.225.1"
    ttl          = "1000"
    create_cname = false
  },
  omicron = {
    route53_zone = "devops-iac3.local"
    ip_address   = "10.27.225.2"
    ttl          = "1000"
    create_cname = true
  },
  pi = {
    route53_zone = "devops-iac3.local"
    ip_address   = "10.27.225.3"
    ttl          = "1000"
    create_cname = true
  }
  pi2 = {
    route53_zone = "devops-iac3.local"
    ip_address   = "10.27.225.31"
    ttl          = "1000"
    create_cname = true
  }
  pi3 = {
    route53_zone = "devops-iac3.local"
    ip_address   = "10.27.225.32"
    ttl          = "1000"
    create_cname = true
  }
  pi4 = {
    route53_zone = "devops-iac3.local"
    ip_address   = "10.27.225.33"
    ttl          = "1000"
    create_cname = true
  }
}

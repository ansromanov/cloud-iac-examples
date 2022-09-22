instance_count = 2
instance_type  = "t3.micro"

subnet_ids = [
  <%= output('vpc.vpc').to_ruby["subnets"]["terraspace-live-vpc-dev-eu-central-1a"]["id"].to_json %>,
  <%= output('vpc.vpc').to_ruby["subnets"]["terraspace-live-vpc-dev-eu-central-1b"]["id"].to_json %>
]

route53_zone_id = <%= output('vpc.vpc').to_ruby["dns_zone"][0]["id"].to_json %>

create_dns_records = true
route53_ttl        = 1000

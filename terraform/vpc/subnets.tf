module "aws_availability_zones" {
  source = "./module/data_sources/aws_availability_zones"
}

locals {
  subnets = {
    Private-1a : {
      cidr_block : "10.0.0.0/20"
      availability_zone_name : module.aws_availability_zones.aws_availability_zone_names[0]
      map_public_ip_on_launch : false
    },
    Private-1b : {
      cidr_block : "10.0.16.0/20"
      availability_zone_name : module.aws_availability_zones.aws_availability_zone_names[1]
      map_public_ip_on_launch : false
    },
    Private-1c : {
      cidr_block : "10.0.32.0/20",
      availability_zone_name : module.aws_availability_zones.aws_availability_zone_names[2]
      map_public_ip_on_launch : false
    },
    Public-1a : {
      cidr_block : "10.0.48.0/20"
      availability_zone_name : module.aws_availability_zones.aws_availability_zone_names[0]
      map_public_ip_on_launch : true
    },
    Public-1b : {
      cidr_block : "10.0.64.0/20"
      availability_zone_name : module.aws_availability_zones.aws_availability_zone_names[1]
      map_public_ip_on_launch : true
    },
    Public-1c : {
      cidr_block : "10.0.80.0/20",
      availability_zone_name : module.aws_availability_zones.aws_availability_zone_names[2]
      map_public_ip_on_launch : true
    }
  }
}

module "subnet" {
  source   = "./module/aws_subnet"
  for_each = local.subnets

  vpc_id = module.vpc.vpc_id

  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone_name
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  name                    = each.key
}
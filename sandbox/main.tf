module "stackgen_1332a371-d1cd-4038-9277-c18ed6cf2142" {
  source                           = "./modules/aws_load_balancer"
  access_logs                      = []
  availability_zone                = null
  connection_logs                  = []
  enable_cross_zone_load_balancing = null
  enable_deletion_protection       = false
  enable_http2                     = true
  internal                         = false
  listener_port                    = null
  listener_protocol                = null
  load_balancer_type               = "application"
  name                             = null
  security_groups                  = null
  subnets                          = null
  tags                             = {}
  target_group_name                = null
  target_group_port                = null
  target_group_protocol            = null
  target_group_protocol_version    = null
  target_id                        = null
  target_type                      = null
  vpc_id                           = null
}

module "stackgen_72445e03-5e97-48e9-a531-216816ceac7d" {
  source = "./modules/aws_dynamodb"
  attribute = [{
    name = "id"
    type = "S"
  }]
  billing_mode                   = "PROVISIONED"
  global_secondary_indexes       = []
  hash_key                       = module.stackgen_77bc3a85-6224-446f-9671-b5549ad94500.arn
  local_secondary_indexes        = []
  point_in_time_recovery_enabled = true
  range_key                      = ""
  read_capacity                  = 1
  server_side_encryption_enabled = true
  stream_view_type               = "NEW_IMAGE"
  table_name                     = "DDB-table-1"
  tags                           = {}
  ttl                            = []
  write_capacity                 = 1
}

module "stackgen_77bc3a85-6224-446f-9671-b5549ad94500" {
  source                    = "./modules/aws_autoscaling"
  ami                       = ""
  desired_capacity          = 2
  enable_public_ip          = false
  health_check_grace_period = 300
  health_check_type         = "EC2"
  instance_type             = "t4g.nano"
  key_name                  = null
  launch_template_version   = "$Latest"
  max_size                  = 4
  min_size                  = 1
  security_groups           = []
  tags                      = []
  target_group_arns = [
    module.stackgen_1332a371-d1cd-4038-9277-c18ed6cf2142.target_group_arn,
  ]
  vpc_zone_identifier = []
}

module "stackgen_ba0d08ef-489d-437a-9d08-2256a7350f4e" {
  source                               = "./modules/aws_vpc"
  cidr_block                           = "172.31.0.0/16"
  enable_dns_hostnames                 = false
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  tags                                 = var.tags
}

module "stackgen_d8da7415-ac8b-4b66-84ad-2f077a4af7c5" {
  source                       = "./modules/aws_s3"
  block_public_access          = true
  bucket_name                  = "s3-userdata"
  bucket_policy                = ""
  enable_versioning            = true
  enable_website_configuration = false
  sse_algorithm                = "aws:kms"
  tags                         = {}
  website_error_document       = "404.html"
  website_index_document       = "index.html"
}


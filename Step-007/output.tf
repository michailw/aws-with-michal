output "vpc_id" {
  value = module.vpc.vpc_id
}

output "cloudfront_url" {
  value = module.frontend.cloudfront_url
}
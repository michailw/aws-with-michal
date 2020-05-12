locals {
  origin_id = "s3-origin-id"
}

resource "aws_s3_bucket" "frontend_bucvket" {
  bucket = var.s3_bucket_name
  acl = "private"
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "Origin access identity"
}

resource "aws_cloudfront_distribution" "cloudfront" {
  enabled = true

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.origin_id
    viewer_protocol_policy = "redirect-to-https"
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  origin {
    domain_name = aws_s3_bucket.frontend_bucvket.bucket_regional_domain_name
    origin_id = local.origin_id
  }

  restrictions {
    geo_restriction {
      restriction_type = "blacklist"

      locations = ["RU"]
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}
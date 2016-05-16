#!/bin/bash
source scripts/env.sh

echo "Begin: Creating Cloudfront distribution for AWS Loft Temp Site S3 Bucket"
sed -e "s/<AWS_LOFT_TEMP_SITE_S3_BUCKET>/$AWS_LOFT_TEMP_SITE_S3_BUCKET/g" \
    -e "s/<AWS_REGION>/$AWS_REGION/g" \
    scripts/cloudfront-conf.json > target/cloudfront-conf.json

json_resp=$(aws cloudfront create-distribution --distribution-config file://target/cloudfront-conf.json)

echo $json_resp | jq -r ".Distribution.Id" > cloudfront_id.txt
echo "End: Creating Cloudfront distribution for AWS Loft Temp Site S3 Bucket"

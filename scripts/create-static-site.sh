#!/bin/bash

cd public
echo "Begin: creating S3 bucket $AWS_LOFT_TEMP_SITE_S3_BUCKET"
aws s3 mb s3://$AWS_LOFT_TEMP_SITE_S3_BUCKET --region $AWS_REGION
aws s3 website s3://$AWS_LOFT_TEMP_SITE_S3_BUCKET/ --index-document index.html
echo "End: creating S3 bucket $AWS_LOFT_TEMP_SITE_S3_BUCKET"

echo "Begin: creating static site ..."

echo "Begin: Sync www content with S3 bucket $AWS_LOFT_TEMP_SITE_S3_BUCKET ..."
aws s3 sync . s3://$AWS_LOFT_TEMP_SITE_S3_BUCKET --cache-control max-age="21600" --acl public-read
echo "End: Sync www content with S3 bucket $AWS_LOFT_TEMP_SITE_S3_BUCKET"
echo "End: creating static site"


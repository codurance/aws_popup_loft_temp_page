#!/usr/bin/bash

echo "Begin: updating static site ..."
cd public
echo "Begin: Sync www content with S3 bucket $AWS_LOFT_TEMP_SITE_S3_BUCKET ..."
aws s3 sync . s3://$AWS_LOFT_TEMP_SITE_S3_BUCKET --cache-control max-age="300" --acl public-read
echo "End: Sync www content with S3 bucket $AWS_LOFT_TEMP_SITE_S3_BUCKET"
echo "End: updating static site ..."

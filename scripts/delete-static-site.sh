#!/bin/bash

echo "Begin: deleting S3 bucket $AWS_LOFT_TEMP_SITE_S3_BUCKET"
aws s3 rb s3://$AWS_LOFT_TEMP_SITE_S3_BUCKET --force
echo "End: deleting S3 bucket $AWS_LOFT_TEMP_SITE_S3_BUCKET"

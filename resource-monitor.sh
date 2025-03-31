#!/bin/bash

# AWS Resource Usage Monitoring Script
# Author: Anusha Dash 
# Description: Monitors AWS EC2, S3, Lambda, and IAM Users & sends alerts.

# Set alert thresholds
EC2_THRESHOLD=5        # Alert if more than 5 EC2 instances are running
S3_THRESHOLD=10        # Alert if more than 10 S3 buckets exist
LAMBDA_THRESHOLD=5     # Alert if more than 5 Lambda functions exist

# Log File
LOG_FILE="aws_resource_usage.log"

# Fetch AWS EC2 instance count
EC2_COUNT=$(aws ec2 describe-instances --query "Reservations[*].Instances[*].InstanceId" --output text | wc -l)
echo "EC2 Instances Running: $EC2_COUNT" | tee -a $LOG_FILE

# Fetch AWS S3 Bucket count
S3_COUNT=$(aws s3 ls | wc -l)
echo "Total S3 Buckets: $S3_COUNT" | tee -a $LOG_FILE

# Fetch AWS Lambda function count
LAMBDA_COUNT=$(aws lambda list-functions --query "Functions[*].FunctionName" --output text | wc -l)
echo "Total Lambda Functions: $LAMBDA_COUNT" | tee -a $LOG_FILE

# Fetch AWS IAM Users count
IAM_USERS=$(aws iam list-users --query "Users[*].UserName" --output text | wc -l)
echo "Total IAM Users: $IAM_USERS" | tee -a $LOG_FILE

# Check thresholds & send alerts
ALERTS=""
if [[ $EC2_COUNT -gt $EC2_THRESHOLD ]]; then
    ALERTS+="⚠️ High EC2 Usage: $EC2_COUNT instances running!\n"
fi

if [[ $S3_COUNT -gt $S3_THRESHOLD ]]; then
    ALERTS+="⚠️ High S3 Bucket Usage: $S3_COUNT buckets found!\n"
fi

if [[ $LAMBDA_COUNT -gt $LAMBDA_THRESHOLD ]]; then
    ALERTS+="⚠️ High Lambda Usage: $LAMBDA_COUNT functions detected!\n"
fi

# Send alert email (requires AWS SNS or a mail service)
if [[ -n "$ALERTS" ]]; then
    echo -e "$ALERTS" | mail -s "AWS Resource Usage Alert 🚨" your-email@example.com
    echo -e "\nAlerts Sent:\n$ALERTS" | tee -a $LOG_FILE
else
    echo "✅ All resource usage is within safe limits." | tee -a $LOG_FILE
fi

# Schedule using cron (Run everyday at 10am)
# crontab -e
# 0 10 * * * /bin/bash /resourse-monitor.sh


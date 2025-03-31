# AWS-Resource-Usage-Monitoring-Using Shell Script

<h3>Project Description</h3>

This script monitors AWS resources, including EC2 instances, S3 buckets, Lambda functions, and IAM users. It logs usage details and sends alerts if predefined thresholds are exceeded.

<h3>Features</h3>

  <ul>
   <li>Fetches real-time AWS resource usage data.</li> 
    <li>Logs usage statistics in aws_resource_usage.log.</li>
    <li>Sends email alerts when thresholds are exceeded.</li>
    <li>Can be scheduled to run automatically using a cron job.</li>
  </ul>


<h3>Prerequisites</h3>

1. AWS CLI must be installed and configured
   ```
   aws configure
   ```

2. mailutils (for email alerts ) should be installed
   ```
   sudo apt install mailutils -y
   ```
   
  


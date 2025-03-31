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


<h3>Writing the Script</h3>
Wrote the script resource-monitor.sh file in vi editor .

<h3>Executing the Script </h3>

1. Made the script executable 

 ``` 
 chmod +x resource-monitor.sh
 ```


2. Run the script manually

 ```
 ./resource-monitor.sh
 ```


<h3>Automate Execution </h3>
Run the script daily at 10 am using Cron job 

1. Open the crontab editor

   ```
   crontab -e
   ```

2. Add the following line

   ```
   0 10 * * * /bin/bash /resourse-monitor.sh
   ```

<h3>Output </h3>

![Screenshot 2025-03-31 201111](https://github.com/user-attachments/assets/0f1b96a4-4ee8-4195-a6e1-2127d949aecb)


<h3>Configuration</h3>

We can modify thresholds of the script as per our requirements 

```
EC2_THRESHOLD=5        # Alert if more than 5 EC2 instances are running
S3_THRESHOLD=10        # Alert if more than 10 S3 buckets exist
LAMBDA_THRESHOLD=5     # Alert if more than 5 Lambda functions exist
```

<h3>Logs</h3>

All execution logs are saved in the log file 

```
aws_resource_usage.log
```


<h3>Alerts </h3>
<ul>
  <li>Alerts are sent via email when resource usage exceeds defined thresholds.</li>
  <li>We can update the email address as our actual email address .</li>
</ul>
  


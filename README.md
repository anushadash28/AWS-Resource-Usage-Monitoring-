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

1. Open the cromtab editor

   ```
   crontab -e
   ```

2. Add the following line

   ```
   0 10 * * * /bin/bash /resourse-monitor.sh
   ```


  


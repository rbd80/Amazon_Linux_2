# Ansible notes

Tried to use the public roles but they were configured for Amazon linux and not Amazon linux 2 LTE.  

Used the Amazon Linux CIS controls until the Linux 2 LTE version is ready.
    # CIS Controls whitepaper:  http://bit.ly/2mGAmUc
    # AWS CIS Whitepaper:       http://bit.ly/2m2Ovrh


## 
TODO remove unnecessary packages (httpd)

This setup only forwards the logs to AWS CloudWatch you need to run the rest of the 
cloudformation script.  Ahoolo

This requires an instance profile with the following to send logs to AWS Cloudwatch
```
{
"Version": "2012-10-17",
"Statement": [
  {
    "Effect": "Allow",
    "Action": [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams"
    ],
    "Resource": [
      "arn:aws:logs:*:*:*"
    ]
  }
 ]
}
```
  Ref 
  https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AgentReference.html
# Walk through on using this playbook
-common role
    update any package
-ossec

    this has multiple parts
    TODO:  Setup this up later https://medium.com/@rafalwilinski/use-aws-lambda-sns-and-node-js-to-automatically-deploy-your-static-site-from-github-to-s3-9e0987a073ec
-cloudwatch logs role
    logforwarder to cloudwatch




TODO:
Add
 https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/set-time.html
###
https://raw.githubusercontent.com/awslabs/ami-builder-packer/master/cloudformation/pipeline.yaml
https://raw.githubusercontent.com/awslabs/hids-cloudwatchlogs-elasticsearch-template/master/cloudformation/hids-cwl-es.template


```
 sudo yum install git -y
```

```
git clone https://github.com/rbd80/Amazon_Linux_2.git
```

```
cd Amazon_Linux_2

```

```
sudo systemctl status clamd@scan
```


```
sudo clamdscan --fdpass /var/log/*
```






## References
- dharrisio.aws-cloudwatch-logs-agent
- anthcourtney.cis-amazon-linux
- https://engineering.vena.io/2016/03/21/deploying-ossec-at-scale/
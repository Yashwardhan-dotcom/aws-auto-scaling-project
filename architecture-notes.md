# Architecture Notes

## Planned Architecture

Internet
    |
Application Load Balancer
    |
Auto Scaling Group
    |
EC2 Instances
    |
CloudWatch Metrics

## Scaling Policy

- Minimum Instances: 2
- Desired Instances: 2
- Maximum Instances: 5

## Health Checks

Application Load Balancer health checks will be used to monitor instance health.

## Monitoring

CloudWatch will monitor:

- CPU Utilization
- Instance Count
- Healthy Hosts

# AWS Auto Scaling Project

## Overview

This project demonstrates a highly available and self-healing web application architecture on AWS using:

- Amazon EC2
- Launch Templates
- Auto Scaling Groups (ASG)
- Application Load Balancer (ALB)
- CloudWatch Monitoring

The infrastructure automatically scales based on CPU utilization and replaces unhealthy instances to maintain availability.

---

## Architecture Diagram

![Architecture](screenshots/architecture/architecture-diagram.png)

This architecture demonstrates a highly available web application deployed across multiple Availability Zones using an Application Load Balancer, Auto Scaling Group, EC2 instances, and CloudWatch-based scaling policies.

- [architecture-notes.md](architecture-notes.md)

---

## Features

- High Availability
- Automatic Scaling
- Load Balancing
- Health Checks
- Self-Healing Infrastructure
- CloudWatch Monitoring

---

## AWS Services Used

| Service | Purpose |
|----------|----------|
| EC2 | Application Servers |
| Launch Template | Instance Configuration |
| Auto Scaling Group | Automatic Scaling |
| Application Load Balancer | Traffic Distribution |
| CloudWatch | Monitoring & Metrics |
| Security Groups | Network Security |

---

## Networking Setup

The project uses a custom VPC with public subnets distributed across multiple Availability Zones.

### Components

- Custom VPC
- Public Subnet 1
- Public Subnet 2
- Internet Gateway
- Public Route Table

### Screenshots

![VPC Overview](screenshots/networking/01-vpc-overview.png)

![Subnets](screenshots/networking/2.1-public_subnets-overview.png)
![Subnets](screenshots/networking/2.2-private_subnet-overview.png)

![Internet Gateway](screenshots/networking/03-internet-gateway.png)

![Route Table](screenshots/networking/04-route-table-routes.png)

---

## Security Configuration

A dedicated security group was created for web servers.

### Inbound Rules

| Protocol | Port | Purpose |
|----------|------|----------|
| TCP | 22 | SSH Administration |
| TCP | 80 | HTTP Web Traffic |

![Security Group](screenshots/security/01-web-server-sg.png)

---

## EC2 Automation

A test EC2 instance was deployed to validate infrastructure automation.

### Bootstrap Process

The User Data script automatically:

- Updates packages
- Installs Apache
- Retrieves EC2 metadata
- Generates a dynamic webpage

### Validation

The deployed instance successfully generated a webpage displaying its own Instance ID.

![Running EC2 Instance](screenshots/ec2/01-ec2-instance-running.png)
![Details of EC2 Instance](screenshots/ec2/02-ec2-instance-details.png)
![Security Groups Attached to EC2](screenshots/ec2/03-security-group-attached.png)

![User Data Success](screenshots/ec2/04-user-data-success.png)

---

## Troubleshooting

### IMDSv2 Metadata Access Issue

During testing, metadata retrieval initially failed with:

```text
401 Unauthorized
```

The issue occurred because the EC2 instance required IMDSv2 authentication.

The bootstrap script was updated to retrieve an IMDSv2 token before accessing instance metadata.

This improvement made the automation compatible with modern AWS security standards.

---

## Launch Template

A reusable launch template was created to standardize EC2 instance deployment.

### Configuration

- Ubuntu Server
- t3.micro Instance Type
- Web Server Security Group
- Automated Bootstrap Script
- IMDSv2 Metadata Integration

### Screenshot

![Launch Template](screenshots/launch-template/01-launch-template-overview.png)

---

## Project Screenshots

### Target Group Health Checks

![Target Group Health](screenshots/target-group/target-group-healthy.png)

All instances registered with the target group are passing health checks successfully.

---

### Application Load Balancer

The Application Load Balancer distributes incoming traffic across multiple EC2 instances running in different Availability Zones.

![ALB](screenshots/load-balancer/alb-active.png)

When I hit the load-balancer's domain then I get this instance
![Output:1](screenshots/load-balancer/alb-response-instance-1.png)
When i refresh the site then I am redirected to another instance as shown below
![Output:2](screenshots/load-balancer/alb-response-instance-2.png)

---

## Auto Scaling Demonstration

A CPU stress test was performed on the application servers.
![CPU Stress](screenshots/cloudwatch/CPU_Stress.png)
When average CPU utilization exceeded the configured threshold:
![Stress Graph](screenshots/cloudwatch/cpu-during-stress.png)

- CloudWatch detected increased CPU usage
- Auto Scaling Group launched an additional EC2 instance
- The new instance was automatically registered with the Target Group
- The Application Load Balancer began routing traffic to the new instance
  ![Automatic Scaling Group Response](screenshots/cloudwatch/asg-scaling-event.png)

- This resulted in the launch of new instance that is visible on the dashboard.
  ![New Instances Launched](screenshots/cloudwatch/3-EC2-Instances.png)

This demonstrates automatic scaling and self-healing infrastructure.

---

## Results

The final architecture successfully demonstrated:

- Traffic distribution across multiple EC2 instances
- Automatic instance replacement after health check failures
- Dynamic scaling based on CPU utilization
- High availability across multiple Availability Zones
- Automated server provisioning using Launch Templates and User Data

  ---

## Learning Outcomes

Through this project I learned:

- AWS VPC Networking
- Internet Gateways
- Route Tables
- Security Groups
- EC2 User Data Automation
- IMDSv2 Metadata Service
- Infrastructure Troubleshooting
- Infrastructure Documentation
- Application Load Balancers
- Target Groups and Health Checks
- Auto Scaling Policies
- CloudWatch Monitoring
- High Availability Architecture

---

## Project Status

✅ Completed

Current Progress:

- [x] GitHub Repository Created
- [x] Custom VPC Created
- [x] Public Subnet 1 Created
- [x] Public Subnet 2 Created
- [x] Internet Gateway Attached
- [x] Route Table Configured
- [x] Security Group Configured
- [x] EC2 Bootstrap Automation
- [x] IMDSv2 Metadata Integration
- [x] Launch Template
- [x] Target Group
- [x] Application Load Balancer
- [x] Auto Scaling Group
- [x] CloudWatch Dashboard
- [x] Stress Testing
- [x] Architecture Diagram
- [x] Final Documentation

---

## Future Improvements

- HTTPS using AWS Certificate Manager
- Route53 custom domain integration
- CI/CD pipeline using GitHub Actions
- Infrastructure as Code using Terraform
- CloudWatch Alarms and SNS notifications

  ---

## Author

Yashwardhan Rathaur

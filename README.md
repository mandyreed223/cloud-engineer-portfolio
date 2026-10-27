# ☁️ Cloud Engineering Portfolio

> Building cloud systems, breaking things responsibly, troubleshooting what happens next, and documenting the journey. ☁️🛠️

Welcome to my cloud engineering portfolio.

I’m an enterprise IT professional with 18 years of experience supporting users and business-critical technology environments, including more than 21 years with Allstate. I’m building on that foundation through hands-on cloud engineering and DevOps projects focused on AWS, Terraform, Infrastructure as Code, Linux, Docker, Kubernetes, automation, monitoring, reliability, and troubleshooting.

Rather than stopping when something deploys successfully, I test behavior, follow dependencies, troubleshoot failures, validate recovery, and document what I learn.

## 🚀 Live Portfolio

🌐 **[mandyreed.com](https://mandyreed.com)**

The portfolio itself is an AWS project, delivered through Amazon S3, CloudFront, Route 53, and AWS Certificate Manager.

---

## 🏗️ Portfolio Architecture

The website is built with HTML and CSS, maintained in GitHub, stored in Amazon S3, and securely delivered through Amazon CloudFront.

```text
👤 Visitor
    ↓
🌐 mandyreed.com
    ↓
🧭 Amazon Route 53
    ↓
🔒 Amazon CloudFront + HTTPS
    ↓
🪣 Amazon S3
    ↓
💻 Portfolio Website
```

**Amazon Route 53** provides DNS routing for the custom domain.

**AWS Certificate Manager** provides the TLS certificate used by CloudFront to securely serve `mandyreed.com` and `www.mandyreed.com` over HTTPS.

Source code and version history are maintained in GitHub.

---

## 👋 About Me

I’m an enterprise IT professional with 18 years of experience supporting users and business-critical technology environments, including more than 21 years with Allstate. My background includes technical troubleshooting, incident resolution, customer support, documentation, access management, Microsoft 365, Active Directory, and enterprise IT operations.

Building on that foundation, I’ve expanded my hands-on experience into cloud engineering and DevOps through projects using AWS, Terraform, Infrastructure as Code, Linux, Docker, Kubernetes, Amazon EKS, Amazon ECR, CI/CD, automation, monitoring, autoscaling, databases, and highly available cloud architectures.

My approach is centered on understanding how systems connect and what happens when they fail. Rather than stopping when something deploys successfully, I test behavior, troubleshoot failures, validate recovery, and document what I learn. This has allowed me to apply the troubleshooting mindset developed throughout my IT career to increasingly complex cloud and DevOps environments.

My goal is to combine my enterprise IT experience with modern cloud engineering practices to build reliable, secure, scalable, and maintainable systems while continuing to deepen my expertise in cloud operations and automation.

> **Something isn't working. Figure out why. 🔎**

---

# 🛠️ Cloud & DevOps Skills

These technologies represent tools, services, and engineering concepts I have used through hands-on projects.

### ☁️ AWS & Cloud

- Amazon EC2
- Amazon S3
- Amazon EFS
- Amazon EKS
- Amazon ECR
- Amazon VPC
- Application Load Balancer
- Elastic Load Balancing
- EC2 Auto Scaling
- Launch Templates
- Target Groups
- Amazon RDS for MySQL
- Multi-AZ RDS
- AWS Systems Manager Session Manager
- AWS Secrets Manager
- Amazon CloudWatch
- CloudWatch Alarms
- NAT Gateway
- Internet Gateway
- Route Tables
- Security Groups
- IAM
- Lambda
- API Gateway
- DynamoDB
- CloudFront
- Route 53
- AWS Certificate Manager
- Bedrock
- Rekognition
- Polly
- Transcribe
- Translate

### 🏗️ Terraform & Infrastructure as Code

- Terraform
- Infrastructure as Code
- Terraform Resource References
- Terraform Remote State
- S3 State Versioning
- Terraform State Locking
- Launch Template Versioning
- EC2 Instance Refresh
- Multi-AZ Architecture
- Infrastructure Lifecycle Management
- Infrastructure Troubleshooting

### ☸️ Kubernetes & Containers

- Kubernetes
- Amazon EKS
- MicroK8s
- kubectl
- eksctl
- Pods
- Deployments
- ReplicaSets
- Services
- ClusterIP Services
- LoadBalancer Services
- Labels and Selectors
- EndpointSlices
- Kubernetes YAML
- Desired-State Reconciliation
- Self-Healing Workloads
- Horizontal Pod Autoscaling
- Metrics Server
- Resource Requests and Limits
- Rolling Updates
- Managed Node Groups
- Multi-Tier Applications
- Kubernetes Troubleshooting
- Docker
- Docker Compose
- Docker Swarm
- Docker Stack
- Dockerfiles
- Docker Networking
- Docker Secrets
- Overlay Networking
- Container Troubleshooting
- Image Versioning
- Persistent Volumes

### 🔧 DevOps, Automation & Operations

- Linux
- AWS CLI
- Git
- GitHub
- GitHub Actions
- Jenkins
- CI/CD
- Monitoring and Alerting
- Application Bootstrapping
- EC2 User Data
- Systems Troubleshooting
- Failure and Recovery Testing

### 🗄️ Applications & Data

- MySQL
- MariaDB Client
- SQL
- Apache HTTP Server
- nginx
- WordPress
- Persistent Application Data
- Shared File Storage
- NFS
- Application-to-Database Communication

---

# ⭐ Featured Cloud & DevOps Projects

These projects represent some of my strongest recent work and the progression from individual technologies into complete cloud architectures.

## ✨ 🏗️ Highly Available 2-Tier AWS Architecture with Terraform

> **🎃 Terraform Built It. I Broke It. Auto Scaling Brought It Back From the Dead.**

Built a production-inspired, highly available AWS architecture entirely with Terraform and deliberately tested it for failure, recovery, database persistence, monitoring, and complete teardown.

### Architecture

```text
User
  ↓
Internet
  ↓
Internet Gateway
  ↓
Application Load Balancer
  ↓
Auto Scaling Group
  ↓
Private EC2 Instances
  ↓
Amazon RDS MySQL
```

The environment uses a custom VPC across two Availability Zones with:

- Two public subnets
- Two private application subnets
- Two private database subnets
- Application Load Balancer
- Auto Scaling Group
- Private EC2 instances
- One NAT Gateway per Availability Zone
- Multi-AZ Amazon RDS for MySQL
- AWS Systems Manager Session Manager
- AWS Secrets Manager
- Amazon CloudWatch
- CloudWatch alarm monitoring
- Security group chaining
- Terraform-managed infrastructure

The security path follows the application tiers:

```text
Internet
   ↓
ALB Security Group
HTTP :80
   ↓
EC2 Security Group
HTTP :80 from ALB only
   ↓
RDS Security Group
MySQL :3306 from EC2 only
```

I connected to the private application tier through Systems Manager Session Manager and used the MariaDB client to work directly with the RDS database. I created a simple service-desk-style `tickets` table, inserted records, queried them, and updated data with SQL.

Then I deliberately terminated an EC2 instance managed by the Auto Scaling Group.

The ASG detected that capacity had fallen below the desired state and launched a replacement instance. The replacement inherited the Launch Template configuration, ran the bootstrap process, installed Apache and the MariaDB client, registered with the Target Group, passed ALB health checks, and began receiving traffic.

The original compute instance was gone.

The database records were still there.

That reinforced one of the most important architectural lessons in the project:

> **Compute can be disposable. Application data cannot.**

CloudWatch also captured the recovery process through the Target Group's `UnHealthyHostCount` metric. The unhealthy-host count temporarily increased during the failure test and returned to zero after the replacement instance became healthy.

**Built. Tested. Broken on purpose. Recovered. Monitored. Destroyed. 💚**

💻 **[View Repository](https://github.com/mandyreed223/terraform-ha-2tier-aws)**

✍️ **[Read the Story on Medium](https://medium.com/@mandymreed/i-built-a-highly-available-aws-architecture-then-i-started-killing-ec2-instances-6f6996657256)**

---

## 🏗️ Terraform Auto Scaling Architecture on AWS

> **I built an Auto Scaling architecture with Terraform. Then one tiny space broke everything. 😅**

Built a highly available AWS web architecture with Terraform using a custom VPC, multi-AZ networking, an Application Load Balancer, private EC2 instances, Launch Templates, Auto Scaling, Systems Manager, and remote Terraform state.

The project became a much deeper troubleshooting exercise when Terraform successfully created the infrastructure but the Target Group repeatedly reported unhealthy instances.

Following the complete application path eventually led to the root cause:

```bash
 #!/bin/bash
```

One leading space before the User Data shebang prevented the bootstrap process from running correctly.

That tiny error created a much larger failure chain:

```text
User Data Fails
      ↓
Apache Never Installs
      ↓
Nothing Listens on Port 80
      ↓
ALB Health Check Fails
      ↓
Instance Becomes Unhealthy
      ↓
ASG Replaces Instance
      ↓
Replacement Receives Same Broken Configuration
      ↓
Cycle Repeats
```

After correcting the User Data, Terraform created a new Launch Template version. I used EC2 Instance Refresh to roll the corrected configuration across the fleet, then deliberately terminated a healthy instance and watched Auto Scaling restore desired capacity.

The project also strengthened my understanding of Terraform resource linkage by following values such as VPC IDs, subnet IDs, Security Group IDs, Target Group ARNs, Launch Template references, and IAM resources as they moved between Terraform resources.

💻 **[View Repository](https://github.com/mandyreed223/terraform-asg-deployment)**

✍️ **[Read the Story on Medium](https://medium.com/@mandymreed/%EF%B8%8F-i-built-an-auto-scaling-architecture-with-terraform-then-one-tiny-space-broke-everything-c1f29147dcd5)**

---

## ☁️☸️ Amazon EKS Deployment

> **I put Kubernetes on AWS. Then I started deleting Pods. ☸️😈**

Moved Kubernetes from a local environment into AWS by deploying and operating a containerized application on Amazon EKS.

The project connected:

- Amazon EKS
- Managed EC2 worker nodes
- Amazon ECR
- Docker
- Kubernetes Deployments and ReplicaSets
- LoadBalancer Services
- Resource requests and limits
- Metrics Server
- Horizontal Pod Autoscaling
- Rolling updates
- Pod self-healing
- CloudWatch control-plane logging

I deliberately deleted a running application Pod and watched the ReplicaSet restore the desired state.

I manually scaled the application from three Pods to six, then configured an HPA with a three-Pod minimum, six-Pod maximum, and 50% CPU target. After generating CPU load, Kubernetes automatically increased the application from three Pods to four and later returned it to the three-Pod baseline.

The project helped make the boundary between Kubernetes and AWS much clearer:

```text
Kubernetes
Deployments • ReplicaSets • Pods • Services • HPA
                     ↕
AWS
EKS • EC2 • VPC • Load Balancing • ECR • CloudWatch
```

💻 **[View Repository](https://github.com/mandyreed223/amazon-eks-deployment)**

✍️ **[Read the Story on Medium](https://medium.com/@mandymreed/i-put-kubernetes-on-aws-then-i-started-deleting-pods-%EF%B8%8F-6b5d9898773a)**

---

## ☸️ WordPress + MySQL Multi-Tier Application on Kubernetes

> **I put WordPress and MySQL on Kubernetes. Then MySQL fought back. ⚔️**

Built a multi-tier WordPress and MySQL application on Kubernetes, moving beyond individual resources into application-to-database communication.

The project included:

- Kubernetes Deployments
- Services
- ClusterIP networking
- Labels and selectors
- ConfigMaps and Secrets
- Persistent storage
- Readiness behavior
- Application-to-database communication
- Kubernetes DNS
- Whole-path troubleshooting

The project reinforced that a Pod showing `Running` does not automatically mean the application is healthy.

Troubleshooting meant following the complete path between workloads, Services, configuration, storage, networking, database connectivity, and the application itself.

💻 **[View Repository](https://github.com/mandyreed223/kubernetes-multitier-application)**

✍️ **[Read the Story on Medium](https://medium.com/@mandymreed/i-put-wordpress-and-mysql-on-kubernetes-then-mysql-fought-back-%EF%B8%8F-05a6370e0926)**

---

# 🧪 More Hands-On Projects

My portfolio also includes projects covering Kubernetes fundamentals and troubleshooting, Docker orchestration, Jenkins, CI/CD, serverless AWS services, automation, and cloud-hosted applications.

| Project | Focus | GitHub | Story |
|---|---|---|---|
| ☸️ Kubernetes Fundamentals | Deployments, ReplicaSets, Services, scaling, self-healing, YAML | [Repository](https://github.com/mandyreed223/kubernetes-fundamentals) | [Medium](https://medium.com/@mandymreed/kubernetes-said-desired-state-i-said-prove-it-%EF%B8%8F-e8fbe1469ec3) |
| 🔎 Kubernetes Troubleshooting Lab | Broken images, CrashLoopBackOff, selectors, probes, resource issues | [Repository](https://github.com/mandyreed223/kubernetes-troubleshooting-lab) | Portfolio project |
| 🐳 WordPress + MySQL Docker Swarm | Multi-service orchestration, EFS, secrets, persistence, failover | [Repository](https://github.com/mandyreed223/wordpress-docker-swarm-aws) | [Medium](https://medium.com/@mandymreed/i-put-wordpress-on-docker-swarm-then-things-got-real-438cbb166861) |
| 🐳 Docker Swarm on AWS | Multi-node orchestration, scaling, self-healing, node draining | [Repository](https://github.com/mandyreed223/docker-swarm-aws-lab) | [Medium](https://medium.com/@mandymreed/i-built-a-docker-swarm-then-i-started-killing-containers-14bfd9fb54ae) |
| 🏗️ Jenkins on AWS with Terraform | Terraform, EC2, IAM, S3, User Data | [Repository](https://github.com/mandyreed223/terraform-jenkins-aws) | [Medium](https://medium.com/@mandymreed/i-put-jenkins-on-aws-with-terraform-because-apparently-clicking-buttons-was-too-easy-%EF%B8%8F-%EF%B8%8F-d6a39afaa125) |
| 🐳 Docker + Jenkins Lab | Container lifecycle, persistent volumes, Compose, custom images | [Repository](https://github.com/mandyreed223/docker-jenkins-lab) | [Medium](https://medium.com/@mandymreed/i-put-jenkins-in-a-container-then-started-deleting-things-e947c8bca954) |
| 🐳 Docker + Apache Rebuild | Dockerfiles, image versioning, networking, repeatable builds | [Repository](https://github.com/mandyreed223/docker-apache-webapp) | [Medium](https://medium.com/@mandymreed/it-worked-on-my-machine-until-it-didnt-3d2df233c995) |
| 🌐 AWS Cloud Engineering Portfolio | S3, CloudFront, Route 53, ACM, DNS, HTTPS | [Repository](https://github.com/mandyreed223/cloud-engineer-portfolio) | [Medium](https://medium.com/@mandymreed/so-i-decided-i-needed-a-portfolio-website-what-could-possibly-go-wrong-5a726e889864) |
| 🌍 Multilingual Audio Pipeline | Transcribe, Translate, Polly, Lambda, S3 | [Repository](https://github.com/mandyreed223/multilingual-audio-pipeline) | [Medium](https://medium.com/@mandymreed/teaching-the-cloud-to-speak-every-language-df07b5764134) |
| 🤖 Prompt Deployment Pipeline | GitHub, S3, Bedrock, CI/CD-style workflow | [Repository](https://github.com/mandyreed223/prompt-deployment-pipeline) | Project documentation |
| 👁️ Rekognition Image Labeling Pipeline | Rekognition, DynamoDB, Lambda, S3 | [Repository](https://github.com/mandyreed223/rekognition-image-labeling-pipeline) | Project documentation |
| 🔊 Polly Text-to-Speech API | Polly, Lambda, API Gateway, S3 | [Repository](https://github.com/mandyreed223/polly_text_to_speech_pipeline) | Project documentation |
| 🌐 Static Website Pipeline | S3, CloudFront, CodePipeline | [Repository](https://github.com/mandyreed223/static_website_pipeline_project) | Project documentation |
| ✅ Required Files Checker | GitHub Actions, CloudWatch, CI validation | [Repository](https://github.com/mandyreed223/file_checker_project) | Project documentation |

---

# 🧠 Engineering Approach

The technical tools change from project to project, but several principles keep showing up.

### ☁️ Deployment Is Only Step One

A successful deployment does not automatically mean the application works.

`terraform apply` can succeed while User Data fails.

An EC2 instance can show `running` while nothing is listening on port 80.

A Kubernetes Pod can show `Running` while the application path is broken.

I validate the infrastructure **and** the application behavior.

### 🔗 Infrastructure Is a Chain of References

Terraform became easier to understand when I stopped seeing resources as isolated blocks and started following the values between them.

```text
VPC
 ↓
Subnets + Security Groups
 ↓
Load Balancer + Application Tier
 ↓
Database Tier
```

A reference such as:

```hcl
vpc_id = aws_vpc.main.id
```

means Terraform takes the real VPC ID created by `aws_vpc.main` and passes it into the dependent resource.

Those references connect individual resources into an architecture and also help Terraform determine dependency order.

### 🔎 Follow the Entire Path

When something fails, I try to follow the request or dependency path rather than guessing at individual components.

```text
User
 ↓
Load Balancer
 ↓
Target Group
 ↓
EC2
 ↓
Application
 ↓
Database
```

The same approach applies to Kubernetes, containers, CI/CD, and cloud infrastructure.

### ♻️ Desired State Is Something You Can Test

Docker Swarm, Kubernetes, and EC2 Auto Scaling reinforced the same idea at different layers:

> Define the state you want, deliberately change reality, and observe how the platform responds.

Deleting Pods, removing containers, draining nodes, and terminating EC2 instances turned self-healing from documentation into observable behavior.

### 💾 Compute Can Be Disposable. Data Cannot.

The HA Terraform architecture made this especially clear.

I terminated an application instance and allowed Auto Scaling to replace it. The compute changed, but the records stored in RDS remained available to the replacement instance.

Persistent data needs an architecture independent of disposable compute.

### 🔐 Secure It, Then Prove It

Private EC2 instances do not automatically require inbound SSH.

Systems Manager Session Manager has allowed me to troubleshoot private instances without public IP addresses, port 22, or SSH key management.

Security controls are more meaningful when I validate that the intended access path actually works.

### 📈 Monitor the Recovery, Not Just the Failure

The HA Terraform project added another layer to failure testing.

It was not enough to terminate an instance and watch Auto Scaling create another one. CloudWatch provided visibility into the unhealthy-host condition and its return to normal after the replacement target became healthy.

### 🧹 Clean Up Counts Too

Building cloud resources is fun.

Understanding dependencies well enough to safely destroy the environment is part of understanding the full lifecycle too.

---

# 🚀 Current Focus

My hands-on Kubernetes experience has progressed from managing individual resources to building multi-tier applications, troubleshooting workloads, and deploying cloud-based environments on Amazon EKS.

```text
Kubernetes Fundamentals
        ↓
Multi-Tier Applications
        ↓
Troubleshooting
        ↓
Amazon EKS
        ↓
Cloud-Native Operations
```

My Terraform experience has followed a similar progression from provisioning individual AWS resources to building increasingly connected multi-AZ architectures.

```text
Terraform Fundamentals
        ↓
Individual AWS Resources
        ↓
Jenkins on AWS
        ↓
Resource Linkage
        ↓
Multi-AZ Auto Scaling Architecture
        ↓
Highly Available 2-Tier Architecture
        ↓
Infrastructure Operations & Reliability
```

The latest architecture integrates VPC networking, public and private subnets, Application Load Balancing, private EC2 instances, Launch Templates, Auto Scaling, IAM, Systems Manager, NAT, Multi-AZ RDS, Secrets Manager, CloudWatch monitoring, application bootstrapping, SQL validation, and failure-recovery testing.

I continue to strengthen these capabilities through hands-on implementation, troubleshooting, and operational problem-solving while expanding my expertise in:

- Microsoft Azure
- Cloud security
- Monitoring and observability
- Site Reliability Engineering
- Kubernetes observability
- Deployment automation
- SQL and database fundamentals
- Deeper Terraform architecture and automation
- Multi-cloud fundamentals, including GCP

My objective is to develop a well-rounded cloud engineering skill set focused on reliability, scalability, security, automation, and operational excellence across modern enterprise environments.

---

# 💼 Professional Background

I have 18 years of experience supporting users in enterprise IT environments and more than 21 years with Allstate.

My professional background includes technical troubleshooting, incident resolution, customer support, documentation, access management, Microsoft 365, Active Directory, and supporting business-critical technology.

My cloud and DevOps work builds on that foundation through hands-on engineering projects rather than replacing the story that came before it.

The technologies may be changing, but one part remains very familiar:

> **Something isn't working. Figure out why. 🔎**

---

# 🔧 Portfolio Troubleshooting

The portfolio itself has been part of the hands-on work.

Building and maintaining it has included:

- Troubleshooting Git and repository issues
- Diagnosing CloudFront caching when updated content was already present in GitHub and S3
- Using CloudFront cache invalidations during deployments
- Troubleshooting Route 53 domain registration and DNS configuration
- Configuring the Route 53 hosted zone
- Using DNS validation for the ACM TLS certificate
- Configuring HTTPS for the root and `www` domains
- Adding alternate domain names to CloudFront
- Creating Route 53 alias records
- Understanding how GitHub, S3, CloudFront, Route 53, DNS, TLS, and the live website connect

What started as a place to showcase cloud projects became another cloud project of its own. 😅

---

# 🔮 What's Next for the Portfolio?

The portfolio will continue evolving with the work behind it.

Potential future improvements include:

- Automated portfolio deployment with GitHub Actions
- Terraform-managed portfolio infrastructure
- Additional architecture visualizations
- Continued UI and accessibility improvements
- New cloud and DevOps projects as they are completed

---

# 🔗 Connect With Me

🌐 **Portfolio:** [mandyreed.com](https://mandyreed.com)

💻 **GitHub:** [github.com/mandyreed223](https://github.com/mandyreed223)

💼 **LinkedIn:** [linkedin.com/in/mandymreed](https://www.linkedin.com/in/mandymreed/)

✍️ **Medium:** [medium.com/@mandymreed](https://medium.com/@mandymreed)

---

## 👩‍💻 Mandy Reed

Enterprise IT professional building hands-on cloud and DevOps engineering experience through AWS, Terraform, Infrastructure as Code, highly available architectures, Amazon EKS, Linux, Docker, Kubernetes, databases, monitoring, automation, troubleshooting, and technical writing.

☁️ **Build it. Troubleshoot it. Understand it. Then build something harder.** 🚀

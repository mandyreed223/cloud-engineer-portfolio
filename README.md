**# ☁️ Cloud Engineering Portfolio**

\> Building cloud systems, breaking things responsibly, troubleshooting what happens next, and documenting the journey. ☁️🛠️

Welcome to my cloud engineering portfolio.

I’m an enterprise IT professional with 18 years of experience supporting users and business-critical technology environments, including more than 21 years with Allstate. I’m building on that foundation through hands-on cloud engineering and DevOps projects focused on AWS, Terraform, Infrastructure as Code, Linux, Docker, Kubernetes, CI/CD, automation, monitoring, reliability, and troubleshooting.

Rather than stopping when something deploys successfully, I test behavior, follow dependencies, troubleshoot failures, validate recovery, and document what I learn.

**## 🚀 Live Portfolio**

🌐 **\*\*[mandyreed.com]\(**https\://mandyreed.com**)\*\***

The portfolio itself is an AWS project, secured behind Amazon CloudFront with a private S3 origin and automatically deployed through GitHub Actions using OIDC federation and a least-privilege AWS IAM role.

**---**

**## 🏗️ Portfolio Architecture**

The website is built with HTML and CSS, maintained in GitHub, and automatically deployed to AWS through GitHub Actions. GitHub authenticates to AWS using OpenID Connect (OIDC) and assumes a least-privilege IAM role, eliminating the need to store long-lived AWS access keys in GitHub.

```text
💻 VS Code
    ↓
🐙 GitHub Repository
    ↓ Push to main
⚙️ GitHub Actions
    ↓ OIDC Federation
🔐 AWS IAM Role
    ↓ S3 Sync + CloudFront Invalidation
🪣 Private Amazon S3
    ↓ Origin Access Control
🔒 Amazon CloudFront + HTTPS
    ↓
🧭 Amazon Route 53
    ↓
🌐 mandyreed.com
    ↓
👤 Visitor
```

**Amazon S3** stores the website files in a private bucket. Direct public access to the S3 origin is blocked.

**Amazon CloudFront** securely delivers the website and accesses the private S3 origin through Origin Access Control (OAC).

**Amazon Route 53** provides DNS routing for the custom domain.

**AWS Certificate Manager** provides the TLS certificate used by CloudFront to securely serve `mandyreed.com` and `www.mandyreed.com` over HTTPS.

**GitHub Actions** automatically deploys changes pushed to the `main` branch. The workflow uses GitHub OIDC federation to assume a dedicated AWS IAM role, receives temporary AWS credentials, uploads the website files to S3, and creates a CloudFront invalidation so updated content is served without a manual AWS Console deployment.

The IAM role follows least-privilege principles and is restricted to the portfolio repository and `main` branch. Its permissions are limited to the S3 object operations required for deployment and CloudFront cache invalidation.

**---**

**## 👋 About Me**

I’m an enterprise IT professional with 18 years of experience supporting users and business-critical technology environments, including more than 21 years with Allstate. My background includes technical troubleshooting, incident resolution, customer support, documentation, access management, Microsoft 365, Active Directory, and enterprise IT operations.

Building on that foundation, I’ve expanded my hands-on experience into cloud engineering and DevOps through projects using AWS, Terraform, Infrastructure as Code, Linux, Docker, Kubernetes, Amazon EKS, Amazon ECR, Amazon ECS, AWS Fargate, Jenkins, CI/CD, automation, monitoring, autoscaling, databases, and highly available cloud architectures.

My approach is centered on understanding how systems connect and what happens when they fail. Rather than stopping when something deploys successfully, I test behavior, troubleshoot failures, validate recovery, and document what I learn. This has allowed me to apply the troubleshooting mindset developed throughout my IT career to increasingly complex cloud and DevOps environments.

My goal is to combine my enterprise IT experience with modern cloud engineering practices to build reliable, secure, scalable, and maintainable systems while continuing to deepen my expertise in cloud operations and automation.

\> **\*\*Something isn't working. Figure out why. 🔎\*\***

**---**

**# 🛠️ Cloud & DevOps Skills**

These technologies represent tools, services, and engineering concepts I have used through hands-on projects.

**### ☁️ AWS & Cloud**

\* Amazon EC2

\* Amazon S3

\* Amazon EFS

\* Amazon EKS

\* Amazon ECR

\* Amazon ECS

\* AWS Fargate

\* ECS Task Definitions

\* ECS Services

\* Amazon VPC

\* Application Load Balancer

\* Elastic Load Balancing

\* EC2 Auto Scaling

\* Launch Templates

\* Target Groups

\* Amazon RDS for MySQL

\* Multi-AZ RDS

\* AWS Systems Manager Session Manager

\* AWS Secrets Manager

\* Amazon CloudWatch

\* CloudWatch Alarms

\* NAT Gateway

\* Internet Gateway

\* Route Tables

\* Security Groups

\* IAM

\* Lambda

\* API Gateway

\* DynamoDB

\* CloudFront

\* Route 53

\* AWS Certificate Manager

\* Bedrock

\* Rekognition

\* Polly

\* Transcribe

\* Translate

**### 🏗️ Terraform & Infrastructure as Code**

\* Terraform

\* Infrastructure as Code

\* Terraform Resource References

\* Terraform Remote State

\* S3 State Versioning

\* Terraform State Locking

\* Launch Template Versioning

\* EC2 Instance Refresh

\* Multi-AZ Architecture

\* Infrastructure Lifecycle Management

\* Infrastructure Troubleshooting

**### ☸️ Kubernetes & Containers**

\* Kubernetes

\* Amazon EKS

\* MicroK8s

\* kubectl

\* eksctl

\* Pods

\* Deployments

\* ReplicaSets

\* Services

\* ClusterIP Services

\* LoadBalancer Services

\* Labels and Selectors

\* EndpointSlices

\* Kubernetes YAML

\* Desired-State Reconciliation

\* Self-Healing Workloads

\* Horizontal Pod Autoscaling

\* Metrics Server

\* Resource Requests and Limits

\* Rolling Updates

\* Managed Node Groups

\* Multi-Tier Applications

\* Kubernetes Troubleshooting

\* Docker

\* Docker Compose

\* Docker Swarm

\* Docker Stack

\* Dockerfiles

\* Docker Networking

\* Docker Secrets

\* Overlay Networking

\* Container Troubleshooting

\* Image Versioning

\* Persistent Volumes

**### 🔧 DevOps, Automation & Operations**

\* Linux

\* AWS CLI

\* Git

\* GitHub

\* GitHub Actions

\* Jenkins

\* Jenkins Pipelines

\* CI/CD

\* CI/CD Quality Gates

\* Containerized Deployment Automation

\* Monitoring and Alerting

\* Application Bootstrapping

\* EC2 User Data

\* Systems Troubleshooting

\* Failure and Recovery Testing

**### 🗄️ Applications & Data**

\* MySQL

\* MariaDB Client

\* SQL

\* Apache HTTP Server

\* nginx

\* WordPress

\* Persistent Application Data

\* Shared File Storage

\* NFS

\* Application-to-Database Communication

**---**

**# ⭐ Featured Cloud & DevOps Projects**

These projects represent some of my strongest recent work and the progression from individual technologies into complete cloud architectures and automated delivery workflows.

**## ✨ 🏗️ Highly Available 2-Tier AWS Architecture with Terraform**

\> **\*\*🎃 Terraform Built It. I Broke It. Auto Scaling Brought It Back From the Dead.\*\***

Built a production-inspired, highly available AWS architecture entirely with Terraform and deliberately tested it for failure, recovery, database persistence, monitoring, and complete teardown.

**### Architecture**

\`\`\`text

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

\`\`\`

The environment uses a custom VPC across two Availability Zones with:

\* Two public subnets

\* Two private application subnets

\* Two private database subnets

\* Application Load Balancer

\* Auto Scaling Group

\* Private EC2 instances

\* One NAT Gateway per Availability Zone

\* Multi-AZ Amazon RDS for MySQL

\* AWS Systems Manager Session Manager

\* AWS Secrets Manager

\* Amazon CloudWatch

\* CloudWatch alarm monitoring

\* Security group chaining

\* Terraform-managed infrastructure

The security path follows the application tiers:

\`\`\`text

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

\`\`\`

I connected to the private application tier through Systems Manager Session Manager and used the MariaDB client to work directly with the RDS database. I created a simple service-desk-style \`tickets\` table, inserted records, queried them, and updated data with SQL.

Then I deliberately terminated an EC2 instance managed by the Auto Scaling Group.

The ASG detected that capacity had fallen below the desired state and launched a replacement instance. The replacement inherited the Launch Template configuration, ran the bootstrap process, installed Apache and the MariaDB client, registered with the Target Group, passed ALB health checks, and began receiving traffic.

The original compute instance was gone.

The database records were still there.

That reinforced one of the most important architectural lessons in the project:

\> **\*\*Compute can be disposable. Application data cannot.\*\***

CloudWatch also captured the recovery process through the Target Group's \`UnHealthyHostCount\` metric. The unhealthy-host count temporarily increased during the failure test and returned to zero after the replacement instance became healthy.

**\*\*Built. Tested. Broken on purpose. Recovered. Monitored. Destroyed. 💚\*\***

💻 **\*\*[View Repository]\(**https\://github.com/mandyreed223/terraform-ha-2tier-aws**)\*\***

✍️ **\*\*[Read the Story on Medium]\(**https\://medium.com/@mandymreed/i-built-a-highly-available-aws-architecture-then-i-started-killing-ec2-instances-6f6996657256**)\*\***

**---**

**## 🚀 Jenkins CI/CD Pipeline to AWS ECS Fargate**

\> **\*\*I built a CI/CD pipeline. Then I broke the pipeline. 💀\*\***

Built an end-to-end CI/CD pipeline connecting GitHub, Jenkins, Docker, Amazon ECR, Amazon ECS, and AWS Fargate.

**### Pipeline**

\`\`\`text

GitHub Push

    ↓

Jenkins Pipeline

    ↓

Docker Image Build

    ↓

Application Quality Gate

    ↓

Amazon ECR

    ↓

ECS Task Definition Revision

    ↓

ECS Service

    ↓

AWS Fargate

\`\`\`

A source change triggers Jenkins to build a versioned Docker image and validate the application before publication. Successful releases are pushed to Amazon ECR, registered as new ECS task definition revisions, and deployed through an ECS service running on AWS Fargate.

I deliberately introduced a broken application release to test the quality gate.

The validation stage failed, and Jenkins stopped the pipeline before the broken image could be pushed to ECR or deployed to ECS. The existing deployment remained healthy.

After fixing the application, I ran the pipeline again and validated the complete automated deployment path.

I also terminated a running ECS task and observed ECS desired-state behavior automatically launch a replacement task.

For AWS authentication, the Jenkins EC2 instance uses an attached IAM role rather than storing long-lived AWS access keys in Jenkins.

That experiment reinforced an important CI/CD lesson:

\> **\*\*A pipeline that blocks a bad release is doing its job.\*\***

💻 **\*\*[View Repository]\(**https\://github.com/mandyreed223/jenkins-cicd-aws-pipeline**)\*\***

✍️ **\*\*[Read the Story on Medium]\(**https\://medium.com/@mandymreed/i-built-a-ci-cd-pipeline-then-i-broke-the-pipeline-2397aae6bc7b**)\*\***

**---**

**## 🏗️ Terraform Auto Scaling Architecture on AWS**

\> **\*\*I built an Auto Scaling architecture with Terraform. Then one tiny space broke everything. 😅\*\***

Built a highly available AWS web architecture with Terraform using a custom VPC, multi-AZ networking, an Application Load Balancer, private EC2 instances, Launch Templates, Auto Scaling, Systems Manager, and remote Terraform state.

The project became a much deeper troubleshooting exercise when Terraform successfully created the infrastructure but the Target Group repeatedly reported unhealthy instances.

Following the complete application path eventually led to the root cause:

\`\`\`bash

 #!/bin/bash

\`\`\`

One leading space before the User Data shebang prevented the bootstrap process from running correctly.

That tiny error created a much larger failure chain:

\`\`\`text

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

\`\`\`

After correcting the User Data, Terraform created a new Launch Template version. I used EC2 Instance Refresh to roll the corrected configuration across the fleet, then deliberately terminated a healthy instance and watched Auto Scaling restore desired capacity.

The project also strengthened my understanding of Terraform resource linkage by following values such as VPC IDs, subnet IDs, Security Group IDs, Target Group ARNs, Launch Template references, and IAM resources as they moved between Terraform resources.

💻 **\*\*[View Repository]\(**https\://github.com/mandyreed223/terraform-asg-deployment**)\*\***

✍️ **\*\*[Read the Story on Medium]\(**https\://medium.com/@mandymreed/%EF%B8%8F-i-built-an-auto-scaling-architecture-with-terraform-then-one-tiny-space-broke-everything-c1f29147dcd5**)\*\***

**---**

**## ☁️☸️ Amazon EKS Deployment**

\> **\*\*I put Kubernetes on AWS. Then I started deleting Pods. ☸️😈\*\***

Moved Kubernetes from a local environment into AWS by deploying and operating a containerized application on Amazon EKS.

The project connected:

\* Amazon EKS

\* Managed EC2 worker nodes

\* Amazon ECR

\* Docker

\* Kubernetes Deployments and ReplicaSets

\* LoadBalancer Services

\* Resource requests and limits

\* Metrics Server

\* Horizontal Pod Autoscaling

\* Rolling updates

\* Pod self-healing

\* CloudWatch control-plane logging

I deliberately deleted a running application Pod and watched the ReplicaSet restore the desired state.

I manually scaled the application from three Pods to six, then configured an HPA with a three-Pod minimum, six-Pod maximum, and 50% CPU target. After generating CPU load, Kubernetes automatically increased the application from three Pods to four and later returned it to the three-Pod baseline.

The project helped make the boundary between Kubernetes and AWS much clearer:

\`\`\`text

Kubernetes

Deployments • ReplicaSets • Pods • Services • HPA

                     ↕

AWS

EKS • EC2 • VPC • Load Balancing • ECR • CloudWatch

\`\`\`

💻 **\*\*[View Repository]\(**https\://github.com/mandyreed223/amazon-eks-deployment**)\*\***

✍️ **\*\*[Read the Story on Medium]\(**https\://medium.com/@mandymreed/i-put-kubernetes-on-aws-then-i-started-deleting-pods-%EF%B8%8F-6b5d9898773a**)\*\***

**---**

**## ☸️ WordPress + MySQL Multi-Tier Application on Kubernetes**

\> **\*\*I put WordPress and MySQL on Kubernetes. Then MySQL fought back. ⚔️\*\***

Built a multi-tier WordPress and MySQL application on Kubernetes, moving beyond individual resources into application-to-database communication.

The project included:

\* Kubernetes Deployments

\* Services

\* ClusterIP networking

\* Labels and selectors

\* ConfigMaps and Secrets

\* Persistent storage

\* Readiness behavior

\* Application-to-database communication

\* Kubernetes DNS

\* Whole-path troubleshooting

The project reinforced that a Pod showing \`Running\` does not automatically mean the application is healthy.

Troubleshooting meant following the complete path between workloads, Services, configuration, storage, networking, database connectivity, and the application itself.

💻 **\*\*[View Repository]\(**https\://github.com/mandyreed223/kubernetes-multitier-application**)\*\***

✍️ **\*\*[Read the Story on Medium]\(**https\://medium.com/@mandymreed/i-put-wordpress-and-mysql-on-kubernetes-then-mysql-fought-back-%EF%B8%8F-05a6370e0926**)\*\***

**---**

**# 🧪 More Hands-On Projects**

My portfolio also includes projects covering Kubernetes fundamentals and troubleshooting, Docker orchestration, earlier Jenkins work, serverless AWS services, automation, CI validation, and cloud-hosted applications.

\| Project                                 | Focus                                                               | GitHub                                                                            | Story                                                                                                                                                          |

\| --------------------------------------- | ------------------------------------------------------------------- | --------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |

\| ☸️ Kubernetes Fundamentals              | Deployments, ReplicaSets, Services, scaling, self-healing, YAML     | [Repository]\(https\://github.com/mandyreed223/kubernetes-fundamentals)             | [Medium]\(https\://medium.com/@mandymreed/kubernetes-said-desired-state-i-said-prove-it-%EF%B8%8F-e8fbe1469ec3)                                                  |

\| 🔎 Kubernetes Troubleshooting Lab       | Broken images, CrashLoopBackOff, selectors, probes, resource issues | [Repository]\(https\://github.com/mandyreed223/kubernetes-troubleshooting-lab)      | Portfolio project                                                                                                                                              |

\| 🐳 WordPress + MySQL Docker Swarm       | Multi-service orchestration, EFS, secrets, persistence, failover    | [Repository]\(https\://github.com/mandyreed223/wordpress-docker-swarm-aws)          | [Medium]\(https\://medium.com/@mandymreed/i-put-wordpress-on-docker-swarm-then-things-got-real-438cbb166861)                                                     |

\| 🐳 Docker Swarm on AWS                  | Multi-node orchestration, scaling, self-healing, node draining      | [Repository]\(https\://github.com/mandyreed223/docker-swarm-aws-lab)                | [Medium]\(https\://medium.com/@mandymreed/i-built-a-docker-swarm-then-i-started-killing-containers-14bfd9fb54ae)                                                 |

\| 🏗️ Jenkins on AWS with Terraform       | Terraform, EC2, IAM, S3, User Data                                  | [Repository]\(https\://github.com/mandyreed223/terraform-jenkins-aws)               | [Medium]\(https\://medium.com/@mandymreed/i-put-jenkins-on-aws-with-terraform-because-apparently-clicking-buttons-was-too-easy-%EF%B8%8F-%EF%B8%8F-d6a39afaa125) |

\| 🐳 Docker + Jenkins Lab                 | Container lifecycle, persistent volumes, Compose, custom images     | [Repository]\(https\://github.com/mandyreed223/docker-jenkins-lab)                  | [Medium]\(https\://medium.com/@mandymreed/i-put-jenkins-in-a-container-then-started-deleting-things-e947c8bca954)                                                |

\| 🐳 Docker + Apache Rebuild              | Dockerfiles, image versioning, networking, repeatable builds        | [Repository]\(https\://github.com/mandyreed223/docker-apache-webapp)                | [Medium]\(https\://medium.com/@mandymreed/it-worked-on-my-machine-until-it-didnt-3d2df233c995)                                                                   |

\| 🌐 AWS Cloud Engineering Portfolio      | Private S3, CloudFront OAC, Route 53, ACM, GitHub Actions, OIDC, IAM, automated deployment | [Repository]\(https\://github.com/mandyreed223/cloud-engineer-portfolio)            | [Medium]\(https\://medium.com/@mandymreed/so-i-decided-i-needed-a-portfolio-website-what-could-possibly-go-wrong-5a726e889864)                                   |

\| ⚡ Lambda EC2 Shutdown Automation        | Lambda, EC2, Python, IAM, serverless cloud automation               | [Repository]\(https\://github.com/mandyreed223/lambda_to_stop_ec2_instances)        | [Medium]\(https\://medium.com/@mandymreed/teaching-the-cloud-when-to-sleep-automating-ec2-shutdowns-with-aws-lambda-be8f63055408)                                |

\| 🌍 Multilingual Audio Pipeline          | Transcribe, Translate, Polly, Lambda, S3                            | [Repository]\(https\://github.com/mandyreed223/multilingual-audio-pipeline)         | [Medium]\(https\://medium.com/@mandymreed/teaching-the-cloud-to-speak-every-language-df07b5764134)                                                               |

\| 🤖 Prompt Deployment Pipeline           | GitHub, S3, Bedrock, CI/CD-style workflow                           | [Repository]\(https\://github.com/mandyreed223/prompt-deployment-pipeline)          | [Medium]\(https\://medium.com/@mandymreed/teaching-the-cloud-how-to-write-bbfcd091634f)                                                                          |

\| 👁️ Rekognition Image Labeling Pipeline | Rekognition, DynamoDB, Lambda, S3                                   | [Repository]\(https\://github.com/mandyreed223/rekognition-image-labeling-pipeline) | [Medium]\(https\://medium.com/@mandymreed/when-your-ci-pipeline-starts-recognizing-pictures-be370329bacb)                                                        |

\| 🔊 Polly Text-to-Speech API             | Polly, Lambda, API Gateway, S3                                      | [Repository]\(https\://github.com/mandyreed223/polly_text_to_speech_pipeline)       | [Medium]\(https\://medium.com/@mandymreed/teaching-the-cloud-to-read-aloud-building-a-text-to-speech-ci-cd-pipeline-with-amazon-polly-2ea8df17d30f)              |

\| 🌐 Static Website Pipeline              | S3, CloudFront, CodePipeline                                        | [Repository]\(https\://github.com/mandyreed223/static_website_pipeline_project)     | [Medium]\(https\://medium.com/@mandymreed/from-git-commit-to-global-cdn-building-a-real-ci-cd-pipeline-on-aws-9c4bffa6eba2)                                      |

\| ✅ Required Files Checker                | GitHub Actions, CloudWatch, CI validation                           | [Repository]\(https\://github.com/mandyreed223/file_checker_project)                | [Medium]\(https\://medium.com/@mandymreed/no-readme-no-entry-the-repo-bouncers-guide-to-ci-cd-enforcement-5685445ee1d9)                                          |

**---**

**# 🧠 Engineering Approach**

The technical tools change from project to project, but several principles keep showing up.

**### ☁️ Deployment Is Only Step One**

A successful deployment does not automatically mean the application works.

\`terraform apply\` can succeed while User Data fails.

An EC2 instance can show \`running\` while nothing is listening on port 80.

A Kubernetes Pod can show \`Running\` while the application path is broken.

I validate the infrastructure **\*\*and\*\*** the application behavior.

**### 🔗 Infrastructure Is a Chain of References**

Terraform became easier to understand when I stopped seeing resources as isolated blocks and started following the values between them.

\`\`\`text

VPC

 ↓

Subnets + Security Groups

 ↓

Load Balancer + Application Tier

 ↓

Database Tier

\`\`\`

A reference such as:

\`\`\`hcl

vpc_id = aws_vpc.main.id

\`\`\`

means Terraform takes the real VPC ID created by \`aws_vpc.main\` and passes it into the dependent resource.

Those references connect individual resources into an architecture and also help Terraform determine dependency order.

**### 🔎 Follow the Entire Path**

When something fails, I try to follow the request or dependency path rather than guess
# ☁️ Cloud Engineering Portfolio

> Building cloud projects, breaking things responsibly, and documenting what I learn along the way. ☁️🛠️

Welcome to my cloud engineering portfolio!

This project brings together my enterprise IT background with the cloud and DevOps skills I am developing through hands-on projects, troubleshooting, automation, Infrastructure as Code, containerization, orchestration, and technical writing.

## 🚀 Live Website

🌐 [mandyreed.com](https://mandyreed.com)

The portfolio is delivered through AWS using a custom domain, HTTPS, Amazon CloudFront, Amazon S3, Route 53, and AWS Certificate Manager.

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

Amazon Route 53 provides DNS routing for the custom domain.

AWS Certificate Manager provides the TLS certificate used by CloudFront to securely serve both `mandyreed.com` and `www.mandyreed.com` over HTTPS.

Source code and version history are maintained in GitHub.

---

## 👋 About This Project

What started as a place to showcase cloud projects became a cloud project of its own. 😅

Building this portfolio has given me hands-on experience with:

* Amazon S3
* Amazon CloudFront
* Amazon Route 53
* AWS Certificate Manager
* DNS
* HTTPS/TLS
* CDN caching
* Cache invalidation
* Git and GitHub
* HTML and CSS
* Responsive web design
* Deployment troubleshooting
* Technical documentation

The portfolio has continued to grow alongside my technical skills and now showcases work involving AWS, Amazon EKS, Amazon ECR, Terraform, Infrastructure as Code, Linux, Docker, Docker Swarm, Kubernetes, multi-tier applications, container orchestration, Amazon EFS, Jenkins, CI/CD, automation, IAM, serverless technologies, persistent storage, container networking, image versioning, desired-state reconciliation, autoscaling, monitoring, and cloud troubleshooting.

My goal is not simply to show which technologies I have used.

I want the projects to demonstrate how I approach technical problems: understanding how services connect, troubleshooting failures, validating that environments actually work, improving security and repeatability, and documenting what I learn along the way.

---

## ✨ Portfolio Features

* Professional cloud engineering portfolio
* Custom `mandyreed.com` domain
* HTTPS/TLS-secured delivery
* Route 53 DNS routing
* CloudFront content delivery
* Responsive desktop and mobile design
* Cloud and DevOps skills showcase
* Featured project repositories
* Project stories and technical writing
* AWS architecture documentation
* Current learning roadmap
* GitHub, LinkedIn, and Medium integration
* Engineering lessons learned through hands-on projects

---

## 🛠️ Technologies Used to Build the Portfolio

### Frontend

* HTML5
* CSS3
* Responsive web design

### AWS

* Amazon S3
* Amazon CloudFront
* Amazon Route 53
* AWS Certificate Manager

### Development Tools

* Git
* GitHub
* Visual Studio Code

---

# ☁️ Cloud & DevOps Skills Featured

These technologies represent tools and services I have practiced through hands-on projects:

### AWS

* Amazon EC2
* Amazon S3
* Amazon EFS
* Amazon EKS
* Amazon ECR
* Amazon VPC
* Elastic Load Balancing
* Amazon CloudFront
* Amazon Route 53
* AWS Certificate Manager
* AWS Lambda
* AWS IAM
* Amazon DynamoDB
* Amazon API Gateway
* Amazon CloudWatch
* Amazon Bedrock
* Amazon Rekognition
* Amazon Polly
* Amazon Transcribe
* Amazon Translate

### Infrastructure & DevOps

* Terraform
* Infrastructure as Code
* Linux
* Docker
* Docker Compose
* Docker Swarm
* Docker Stack
* Container Orchestration
* Docker Secrets
* Docker Networking
* Docker Image Versioning
* Container Troubleshooting
* Overlay Networking
* Persistent Volumes
* Kubernetes
* Amazon EKS
* MicroK8s
* kubectl
* eksctl
* AWS CLI
* Kubernetes Pods
* Kubernetes Deployments
* ReplicaSets
* Kubernetes Services
* ClusterIP Services
* LoadBalancer Services
* Labels and Selectors
* EndpointSlices
* Kubernetes YAML
* Declarative Configuration
* Desired-State Reconciliation
* Self-Healing Workloads
* Kubernetes Scaling
* Horizontal Pod Autoscaling
* Kubernetes Metrics Server
* Resource Requests and Limits
* Rolling Updates
* Managed Node Groups
* Multi-Tier Applications
* Application-to-Database Communication
* Kubernetes Troubleshooting
* Jenkins
* Dockerfiles
* Git
* GitHub
* GitHub Actions
* CI/CD

### Applications & Data

* Apache HTTP Server
* nginx
* WordPress
* MySQL
* Shared File Storage
* NFS
* Persistent Application Data

---

# 💻 Featured Cloud & DevOps Projects

These are the projects where I get to build things, troubleshoot them, figure out why they broke, and occasionally wonder why I thought making the architecture more complicated was a good idea. 😅

## ✨ ☁️☸️ Amazon EKS Deployment

***I put Kubernetes on AWS. Then I started deleting Pods. ☸️😈***

Moved my Kubernetes learning from a local environment into AWS by building, deploying, scaling, monitoring, updating, and troubleshooting a containerized application on Amazon Elastic Kubernetes Service (EKS).

Rather than stopping after getting a workload running, I followed the complete path from local application code to Docker, Amazon ECR, Kubernetes, AWS load balancing, autoscaling, and CloudWatch.

The project included:

* Amazon EKS
* Kubernetes 1.36
* Amazon EC2
* Amazon ECR
* Amazon VPC
* Elastic Load Balancing
* Amazon CloudWatch
* eksctl
* kubectl
* AWS CLI
* Linux / WSL
* Docker
* nginx
* Managed node groups
* Two Availability Zones
* Private worker networking
* Kubernetes Deployments
* ReplicaSets
* LoadBalancer Services
* Resource requests and limits
* Kubernetes Metrics Server
* Horizontal Pod Autoscaling
* Manual Pod scaling
* Desired-state reconciliation
* Pod self-healing
* Rolling updates
* Versioned container images
* EKS API and audit logging
* Resource cleanup and lifecycle management

I created the EKS cluster using `eksctl` with a managed node group containing two `t3.medium` EC2 worker nodes distributed across two Availability Zones and configured with private networking.

The application started with three nginx Pods managed through a Kubernetes Deployment and ReplicaSet. A Service of type `LoadBalancer` connected the Kubernetes workload to AWS load-balancing infrastructure and provided an externally reachable application endpoint.

I then created a custom HTML/CSS application, packaged it into a Docker image, and pushed the versioned image to a private Amazon ECR repository.

The release path became:

```text
Application Source
      ↓
Docker Build
      ↓
Image Tag
      ↓
Amazon ECR
      ↓
EKS Deployment
      ↓
ReplicaSet
      ↓
Application Pods
```

To test desired-state reconciliation, I deliberately deleted a running application Pod.

The ReplicaSet detected that the actual state no longer matched the desired state and immediately created a replacement while the application remained available through the load balancer.

I manually scaled the Deployment from three Pods to six and observed that the existing EC2 worker nodes had enough capacity to schedule the additional workloads.

That helped reinforce an important distinction:

```text
Pod Scaling
     ≠
Node Scaling
```

I then installed Kubernetes Metrics Server and used `kubectl top` to inspect actual node and Pod CPU and memory consumption.

A Horizontal Pod Autoscaler was configured with a minimum of three replicas, maximum of six replicas, and a 50% CPU target. After generating synthetic CPU load, the HPA automatically increased the application from three Pods to four. Once the load was removed and utilization dropped, Kubernetes returned the Deployment to its three-Pod baseline.

For AWS-native operational visibility, I enabled EKS API and audit logging and verified the control plane was publishing log streams to Amazon CloudWatch.

Finally, I modified the application, built and pushed a versioned `v2` image to ECR, updated the Deployment, and watched Kubernetes create a new ReplicaSet and perform a rolling update while the public application endpoint remained unchanged.

One of the biggest lessons from this project was seeing where Kubernetes responsibilities end and AWS responsibilities begin.

Kubernetes managed the workloads, desired state, Services, ReplicaSets, rolling updates, and autoscaling.

AWS provided the underlying networking, compute, load balancing, container registry, and operational logging.

Understanding how those layers connect turned EKS from “Kubernetes running somewhere in AWS” into an architecture I could actually follow and troubleshoot.

💻 [View Repository](https://github.com/mandyreed223/amazon-eks-deployment)

📖 [Read on Medium](https://medium.com/@mandymreed/i-put-kubernetes-on-aws-then-i-started-deleting-pods-%EF%B8%8F-6b5d9898773a)

---

## ☸️ WordPress + MySQL Multi-Tier Application on Kubernetes

***I put WordPress and MySQL on Kubernetes. Then MySQL fought back. ⚔️***

Built a multi-tier WordPress and MySQL application on Kubernetes, taking the concepts from my Kubernetes Fundamentals project and using them together as part of a larger application architecture.

Instead of working with a single nginx workload, this project introduced application-to-database communication and reinforced how Kubernetes resources depend on one another for the complete application path to work.

The project included:

* Kubernetes
* MicroK8s
* Ubuntu on WSL2
* kubectl
* WordPress
* MySQL
* Multi-tier application architecture
* Kubernetes Deployments
* Kubernetes Services
* ClusterIP networking
* Labels and selectors
* Application-to-database communication
* Persistent application data
* Declarative YAML
* Resource inspection
* Kubernetes networking
* Kubernetes troubleshooting
* Whole-path application validation

This project built directly on the fundamentals I had already practiced with Pods, Deployments, Services, labels, selectors, and declarative configuration.

The difference was that those resources were no longer being explored individually.

They had to work together.

WordPress needed to communicate with MySQL through Kubernetes, which meant the application path depended on more than whether individual Pods appeared healthy.

That became especially clear when MySQL decided not to cooperate. 😅

Troubleshooting the application reinforced an important lesson: a Pod showing `Running` does not automatically mean the application is healthy.

The complete path can involve workloads, Services, labels, selectors, configuration, storage, networking, database connectivity, and the application itself.

Instead of treating each Kubernetes resource as an isolated component, I worked through the relationships between them and followed the application path to understand where communication was failing.

The result was an important progression from learning Kubernetes resources individually to using those resources together as part of a multi-tier application.

💻 [View Repository](https://github.com/mandyreed223/kubernetes-multitier-application)

📖 [Read on Medium](https://medium.com/@mandymreed/i-put-wordpress-and-mysql-on-kubernetes-then-mysql-fought-back-%EF%B8%8F-05a6370e0926)

---

## ☸️ Kubernetes Fundamentals

***Kubernetes said desired state. I said prove it. ☸️***

Built my first hands-on Kubernetes application using MicroK8s on Ubuntu in WSL2.

The project started with a single nginx Pod and gradually moved through the Kubernetes controller and networking layers until the application was managed declaratively using Deployments, ReplicaSets, Services, and YAML.

The project included:

* MicroK8s
* Ubuntu on WSL2
* kubectl
* nginx
* Kubernetes Pods
* Deployments
* ReplicaSets
* ClusterIP Services
* Labels and selectors
* EndpointSlices
* Declarative YAML
* Server-side dry runs
* Scaling
* Desired-state reconciliation
* Pod self-healing
* Rolling updates
* Resource inspection
* Kubernetes troubleshooting

Rather than stopping when the application was running, I deliberately tested the behavior Kubernetes is designed to provide.

I scaled the Deployment to multiple replicas and inspected how the Deployment, ReplicaSet, and Pods related to one another.

Then I deleted a Pod on purpose.

Kubernetes immediately created a replacement because the actual state no longer matched the desired state defined by the Deployment.

That was the moment desired-state reconciliation stopped being an abstract Kubernetes concept and became something I could actually observe.

I also created a ClusterIP Service and explored how labels and selectors connect the Service to the correct Pods while EndpointSlices track the available application endpoints.

The project included a rolling nginx image update so I could watch Kubernetes replace Pods while maintaining the Deployment's desired state.

Finally, I moved the application into reusable YAML and rebuilt it declaratively.

That step also created one of the most useful troubleshooting lessons in the project: a Deployment selector is immutable after creation. Instead of simply working around the error, I traced the relationship between the Deployment selector, Pod template labels, and Service selector, corrected the manifests, recreated the resources, and validated the complete application path again.

The result was not just my first Kubernetes deployment.

It was my first hands-on look at how Kubernetes uses **controllers, desired state, labels, selectors, Services, and declarative configuration to manage an application as a system**.

💻 [View Repository](https://github.com/mandyreed223/kubernetes-fundamentals)

📖 [Read on Medium](https://medium.com/@mandymreed/kubernetes-said-desired-state-i-said-prove-it-%EF%B8%8F-e8fbe1469ec3)

---

## 🐳 WordPress + MySQL Docker Swarm on AWS

***I put WordPress on Docker Swarm. Then things got real. 🐳🔥***

Built a multi-service WordPress and MySQL application across a three-node Docker Swarm running on AWS EC2.

This project took the concepts from my original Docker Swarm lab and added something that changes the conversation quite a bit: **stateful application data**.

The project included:

* Three Ubuntu EC2 instances
* One Docker Swarm manager and two workers
* WordPress
* MySQL
* Docker Stack
* Multi-service orchestration
* Overlay networking
* Docker Secrets
* Amazon EFS shared storage
* NFS
* Persistent WordPress content
* Docker service inspection and logging
* Service scaling and rescheduling
* Worker-node failure testing
* Desired-state recovery
* AWS Security Groups
* Linux system troubleshooting

I mounted Amazon EFS across the Swarm nodes so WordPress content could remain available regardless of which node ran the container and verified shared files across containers.

I also deliberately removed a worker node to observe how Swarm rescheduled services and restored the desired state.

Of course, the infrastructure did not make it easy. 😅

One worker experienced intermittent SSH connectivity and memory pressure, which turned the project into a deeper troubleshooting exercise involving `top`, `free`, `df`, `journalctl`, `systemctl`, Docker events, listening ports, firewall checks, Security Groups, and eventually a reboot.

The result was much more than a working WordPress site. It became an exercise in understanding how **orchestration, networking, storage, application state, Linux, and AWS infrastructure all interact**.

💻 [View Repository](https://github.com/mandyreed223/wordpress-docker-swarm-aws)

📖 [Read on Medium](https://medium.com/@mandymreed/i-put-wordpress-on-docker-swarm-then-things-got-real-438cbb166861)

---

## 🐳 Docker Swarm on AWS

***I built a Docker Swarm. Then I started killing containers. 🐳💀***

Built a three-node Docker Swarm across AWS EC2 instances to explore multi-node container orchestration, service deployment, scaling, self-healing, Docker Stack, and cluster resiliency.

The project included:

* Three AWS EC2 Linux nodes
* Docker Swarm initialization
* Manager and worker nodes
* Replicated services
* Global services
* Service scaling
* Docker Stack deployments
* Overlay networking
* Routing mesh testing
* Node draining
* Task rescheduling
* Self-healing and desired-state reconciliation
* Container failure testing

Rather than stopping once the cluster was running, I intentionally removed containers and changed node availability to observe how Docker Swarm responded and restored the desired state.

I also drained a worker node and validated that the Swarm routing mesh could continue serving the published application through the node while tasks were running elsewhere in the cluster.

💻 [View Repository](https://github.com/mandyreed223/docker-swarm-aws-lab)

📖 [Read on Medium](https://medium.com/@mandymreed/i-built-a-docker-swarm-then-i-started-killing-containers-14bfd9fb54ae)

---

## 🏗️ Jenkins on AWS with Terraform

***It started with one manually deployed Jenkins server. Then I decided Terraform should do the work. 😅***

Deployed Jenkins on AWS using Terraform, progressing from a manual proof of concept to reusable Infrastructure as Code.

The project included:

* Amazon EC2
* Terraform
* Security Groups
* Automated Jenkins installation with User Data
* Private Amazon S3 artifact storage
* IAM Role and Instance Profile
* Least-privilege S3 permissions
* AWS temporary credential validation
* S3 artifact upload and download testing
* Terraform lifecycle management and cleanup

Rather than stopping when `terraform apply` succeeded, I validated that EC2 assumed the correct IAM role and proved that the server could interact with S3 without storing AWS credentials on the instance.

💻 [View Repository](https://github.com/mandyreed223/terraform-jenkins-aws)

📖 [Read on Medium](https://medium.com/@mandymreed/i-put-jenkins-on-aws-with-terraform-because-apparently-clicking-buttons-was-too-easy-%EF%B8%8F-%EF%B8%8F-d6a39afaa125)

---

## 🐳 Docker + Jenkins Lab

***What happens when you start deleting Jenkins containers on purpose? Turns out, quite a lot. 🐳😂***

Built and managed Jenkins in Docker while exploring container lifecycle, persistent storage, Docker Compose, and custom image creation.

Tested data persistence by intentionally removing and recreating Jenkins containers, then built a custom Jenkins image using a Dockerfile and verified the customization inside the running container.

💻 [View Repository](https://github.com/mandyreed223/docker-jenkins-lab)

📖 [Read on Medium](https://medium.com/@mandymreed/i-put-jenkins-in-a-container-then-started-deleting-things-e947c8bca954)

---

## 🐳 Docker + Apache Web App Rebuild

***Same project. Different engineer. 🐳***

Revisited and rebuilt one of my earliest Docker projects after gaining more hands-on experience with containers, networking, troubleshooting, and repeatable deployments.

The original project helped me understand the basic idea of putting an application inside a container. The rebuild focused much more on understanding **how and why the pieces work together**.

The rebuild included:

* Dockerfiles
* Docker image builds
* Image tagging and versioning
* Docker layer caching
* Apache HTTP Server
* Multiple running containers
* Host-to-container port mapping
* Docker networking
* Container inspection
* Container logs
* Container lifecycle management
* Application validation
* Docker cleanup
* Troubleshooting port conflicts
* Troubleshooting container-name conflicts
* Troubleshooting Docker Engine availability
* Comparing container build approaches

Rather than manually configuring a running container and treating the finished container as the product, I used a Dockerfile to define a repeatable build process and create reusable images.

I also ran multiple containers from the application images using different host ports, inspected their configuration and networking, and practiced separating the concepts of **Dockerfile → image → container**.

The biggest difference from the first version was not the application itself.

It was how I approached it.

The first time, I was learning how to make Docker work.

This time, I wanted to understand what Docker was actually doing.

💻 [View Repository](https://github.com/mandyreed223/docker-apache-webapp)

📖 [Read the Updated Project Story on Medium](https://medium.com/@mandymreed/it-worked-on-my-machine-until-it-didnt-3d2df233c995)

---

## ☁️ AWS Cloud Engineering Portfolio

***Building a portfolio was easy. Getting DNS, HTTPS, caching, and a custom domain to cooperate was the adventure. 🌐***

Designed and deployed this portfolio using Amazon S3, CloudFront, Route 53, and AWS Certificate Manager.

Configured a custom domain with DNS routing and HTTPS/TLS, maintained source control through GitHub, and troubleshot deployment, caching, domain registration, DNS, and content delivery issues.

🌐 [View Live Portfolio](https://mandyreed.com)

💻 [View Repository](https://github.com/mandyreed223/cloud-engineer-portfolio)

📖 [Read on Medium](https://medium.com/@mandymreed/so-i-decided-i-needed-a-portfolio-website-what-could-possibly-go-wrong-5a726e889864)

---

## 🤖 Prompt Deployment Pipeline

Built a CI/CD-style workflow using GitHub, Amazon S3, and Amazon Bedrock.

💻 [View Repository](https://github.com/mandyreed223/prompt-deployment-pipeline)

---

## 🌎 Multilingual Audio Pipeline

Created an AWS pipeline using Amazon Transcribe, Amazon Translate, Amazon Polly, AWS Lambda, and Amazon S3.

💻 [View Repository](https://github.com/mandyreed223/multilingual-audio-pipeline)

📖 [Read on Medium](https://medium.com/@mandymreed/teaching-the-cloud-to-speak-every-language-df07b5764134)

---

## 👁️ Rekognition Image Labeling Pipeline

Built an image-processing workflow using Amazon Rekognition, Amazon DynamoDB, AWS Lambda, and Amazon S3.

💻 [View Repository](https://github.com/mandyreed223/rekognition-image-labeling-pipeline)

---

## 🔊 Polly Text-to-Speech API Pipeline

Created a serverless text-to-speech solution using Amazon Polly, AWS Lambda, Amazon API Gateway, and Amazon S3.

💻 [View Repository](https://github.com/mandyreed223/polly_text_to_speech_pipeline)

---

## 🌐 Static Website Pipeline

Built and deployed a static website using Amazon S3, Amazon CloudFront, and AWS CodePipeline.

💻 [View Repository](https://github.com/mandyreed223/static_website_pipeline_project)

---

## ✅ Required Files Checker

Created a GitHub Actions workflow that validates required repository files and logs results to Amazon CloudWatch.

💻 [View Repository](https://github.com/mandyreed223/file_checker_project)

---

# 🧠 Things My Projects Have Taught Me

The technical skills matter, but some of the best lessons happen somewhere between **“this should work”** and **“why is THAT happening?”** 😅

### ☁️ Deployment Is Only Step One

A successful deployment does not automatically mean the application actually works. I validate the environment and prove the application works too.

### 🔎 Follow the Entire Path

Troubleshooting gets easier when I understand how every service connects instead of looking at one component in isolation.

The EKS project extended that path across both Kubernetes and AWS:

```text
Source Code
    ↓
Docker Image
    ↓
Amazon ECR
    ↓
EKS Deployment
    ↓
ReplicaSet
    ↓
Pods
    ↓
Kubernetes Service
    ↓
AWS Load Balancer
    ↓
User
```

### 🔐 Secure It, Then Prove It

Least privilege is more meaningful when I test the permissions and verify that the application can do exactly what it needs.

### ♻️ Desired State Is Something You Can Test

Container orchestration became much easier to understand when I deliberately started removing workloads instead of simply reading about self-healing.

Docker Swarm introduced me to desired-state recovery by replacing containers and rescheduling tasks.

My local Kubernetes projects let me watch Deployments, ReplicaSets, and Pods work together to maintain the number and configuration of workloads I declared.

Amazon EKS showed that the same Kubernetes concepts still apply when those workloads are running on AWS infrastructure.

Deleting an EKS Pod did not require me to repair the application manually. The ReplicaSet recognized that reality no longer matched the desired state and restored the missing workload while the application remained available.

### ☁️ Kubernetes and AWS Operate at Different Layers

One of the biggest lessons from the EKS project was understanding where Kubernetes responsibilities end and AWS responsibilities begin.

Kubernetes managed Deployments, ReplicaSets, Pods, Services, desired state, rolling updates, and Horizontal Pod Autoscaling.

AWS provided the underlying EC2 compute, VPC networking, load balancing, ECR image storage, EKS managed infrastructure, and CloudWatch logging.

Neither layer exists in isolation.

Understanding how the two layers connect made the environment much easier to reason about and troubleshoot.

### 📈 Pods and Nodes Are Different Scaling Layers

Scaling an application does not automatically mean scaling the infrastructure underneath it.

When I manually increased the EKS Deployment from three Pods to six, Kubernetes scheduled the additional workloads onto the existing two worker nodes because sufficient capacity was still available.

That reinforced an important distinction:

**Pod scaling and node scaling solve different problems.**

The Horizontal Pod Autoscaler then added another layer by adjusting application replicas automatically based on CPU utilization.

### 📊 Resource Requests Affect More Than Scheduling

CPU and memory requests help Kubernetes make scheduling decisions, but the EKS project showed me that resource requests can influence other Kubernetes behavior too.

The HPA evaluated CPU utilization relative to the CPU request defined for each application Pod.

That made resource configuration part of the autoscaling story rather than simply a manifest setting.

### 🔄 Services Give Workloads a Stable Front Door

Pods are replaceable.

During self-healing, scaling, and rolling updates, the individual application Pods changed while the external application endpoint remained stable.

The Kubernetes Service separated the application's network identity from the lifecycle of individual Pods, while AWS supplied the external load-balancing infrastructure.

### 📦 Versioned Images Make Releases Easier to Understand

Building separate `v1` and `v2` application images reinforced why container versions matter.

Instead of overwriting an existing image, I could push a new version to ECR, update the Kubernetes Deployment, watch a new ReplicaSet appear, and observe Kubernetes perform the rolling update.

The application changed.

The public endpoint did not.

### 🧩 Labels Create Relationships

My Kubernetes projects reinforced that having healthy individual resources does not automatically mean the application path is correct.

Deployment selectors, Pod labels, and Service selectors create relationships between Kubernetes resources.

A Pod can be running and a Service can exist, but if their labels and selectors do not line up, the Service will not route traffic to the intended workload.

Understanding those relationships made Kubernetes networking much easier to reason about and troubleshoot.

### 🔗 A Healthy Pod Does Not Mean a Healthy Application

The multi-tier Kubernetes project reinforced that troubleshooting cannot stop when individual Pods show `Running`.

WordPress and MySQL may each have workloads in Kubernetes, but the complete application still depends on the relationships between workloads, Services, selectors, configuration, networking, storage, and database connectivity.

A healthy resource is only one part of a healthy application.

That lesson pushed my troubleshooting from checking individual Kubernetes objects toward following the complete application path.

### 💾 Persistent Data Changes Everything

Containers can disappear and be recreated. Application data cannot be treated the same way.

Adding stateful applications such as WordPress and MySQL forced me to think beyond whether a container or Pod was running and start considering where data lives, how workloads access it, what happens when workloads move or restart, and how storage affects application recovery.

### 🧩 The Problem May Be Somewhere Else

A container problem is not always a Docker problem, and a Kubernetes problem is not always a Pod problem.

Troubleshooting these projects has crossed containers, orchestration, Linux, AWS Security Groups, networking, memory, storage, SSH, Services, application configuration, databases, load balancing, resource utilization, cloud infrastructure, and the applications themselves.

Understanding the entire path matters.

### 🔄 Rebuilding Old Work Shows Progress

One of the most useful ways to see how much I have learned is to revisit something I built earlier.

Rebuilding my Docker + Apache project changed the questions I was asking. Instead of simply asking whether I could get a container running, I was thinking about image construction, layers, versioning, networking, port mappings, repeatability, inspection, troubleshooting, and lifecycle management.

**Same project. Different engineer.**

### 🧹 Clean Up Counts Too

Building cloud resources is fun. Knowing how to safely tear them down is part of understanding the full lifecycle.

The EKS project reinforced this because the environment created billable AWS resources across EKS, EC2, load balancing, ECR, and CloudWatch.

Cleanup was not complete until the resources were removed and the environment was verified.

---

# ✍️ Project Stories & Technical Writing

Building the project is only half the story.

I also document what happened along the way: the troubleshooting, mistakes, lessons learned, and occasional **“why is THAT happening?”** moments. 😅

These articles focus less on simply listing technologies and more on explaining what I built, what went wrong, how I troubleshot it, and what I learned from the experience.

## ☁️☸️ Amazon EKS Deployment

***I Put Kubernetes on AWS. Then I Started Deleting Pods. ☸️😈***

My first Amazon EKS project moved Kubernetes from my local environment into AWS and connected several technologies I had previously practiced separately.

I built an EKS cluster, deployed and exposed a containerized application, stored versioned images in Amazon ECR, tested Pod self-healing, manually scaled workloads, configured Horizontal Pod Autoscaling, inspected resource metrics, enabled EKS control-plane logging in CloudWatch, and released an updated application through a rolling deployment.

More importantly, the project helped me understand how Kubernetes and AWS operate at different layers while still forming one complete application path.

📖 [Read on Medium](https://medium.com/@mandymreed/i-put-kubernetes-on-aws-then-i-started-deleting-pods-%EF%B8%8F-6b5d9898773a)

## ☸️ WordPress + MySQL on Kubernetes

***I Put WordPress and MySQL on Kubernetes. Then MySQL Fought Back. ⚔️***

My second hands-on Kubernetes project moved beyond exploring individual Kubernetes resources and into a multi-tier application where WordPress and MySQL had to communicate through Kubernetes.

The project became a practical lesson in Services, selectors, application-to-database communication, persistent data, networking, and why a Pod showing `Running` does not automatically mean the application works.

📖 [Read on Medium](https://medium.com/@mandymreed/i-put-wordpress-and-mysql-on-kubernetes-then-mysql-fought-back-%EF%B8%8F-05a6370e0926)

## ☸️ Kubernetes Fundamentals

***Kubernetes Said Desired State. I Said Prove It. ☸️***

My first hands-on Kubernetes project started with a single nginx Pod and grew into Deployments, ReplicaSets, Services, scaling, self-healing, rolling updates, labels and selectors, EndpointSlices, declarative YAML, and an unexpectedly useful troubleshooting lesson involving an immutable Deployment selector.

📖 [Read on Medium](https://medium.com/@mandymreed/kubernetes-said-desired-state-i-said-prove-it-%EF%B8%8F-e8fbe1469ec3)

### 🐳 WordPress + MySQL Docker Swarm

***I Put WordPress on Docker Swarm. Then Things Got Real.***

What started as a multi-container deployment became a hands-on lesson in Docker Swarm, WordPress, MySQL, Amazon EFS, Docker Secrets, persistent storage, service recovery, and whole-path troubleshooting.

📖 [Read on Medium](https://medium.com/@mandymreed/i-put-wordpress-on-docker-swarm-then-things-got-real-438cbb166861)

### 🐳 Docker Swarm on AWS

***I Built a Docker Swarm. Then I Started Killing Containers. 🐳💀***

Three EC2 servers, one Docker Swarm, and a crash course in scaling, self-healing, Docker Stack, and why containers apparently don't stay dead.

📖 [Read on Medium](https://medium.com/@mandymreed/i-built-a-docker-swarm-then-i-started-killing-containers-14bfd9fb54ae)

### 🛠️ Jenkins on AWS with Terraform

From manually deploying Jenkins to reusable Infrastructure as Code, IAM role-based S3 access, environment validation, and safe Terraform cleanup.

📖 [Read on Medium](https://medium.com/@mandymreed/i-put-jenkins-on-aws-with-terraform-because-apparently-clicking-buttons-was-too-easy-%EF%B8%8F-%EF%B8%8F-d6a39afaa125)

### 🐳 Docker + Jenkins Lab

A hands-on Docker and Jenkins story covering container lifecycle, persistent volumes, Docker Compose, custom Docker images, and the surprisingly useful lesson that deleting a container does not have to mean deleting your data.

📖 [Read on Medium](https://medium.com/@mandymreed/i-put-jenkins-in-a-container-then-started-deleting-things-e947c8bca954)

### 🐳 Docker + Apache: It Worked On My Machine... Until It Didn't

One of my earliest Docker stories, now revisited with a second chapter.

The updated article follows the original container experiment into a more intentional rebuild using Dockerfiles, reusable images, image versioning, layer caching, multiple containers, port mapping, networking, inspection, troubleshooting, and lifecycle management.

The application may look familiar. The way I approached it definitely does not. 🐳

📖 [Read the Updated Story on Medium](https://medium.com/@mandymreed/it-worked-on-my-machine-until-it-didnt-3d2df233c995)

### 🌐 AWS Cloud Engineering Portfolio

A behind-the-scenes look at building and deploying this cloud engineering portfolio, including the deployment, caching, DNS, and custom domain issues I troubleshot along the way.

📖 [Read on Medium](https://medium.com/@mandymreed/so-i-decided-i-needed-a-portfolio-website-what-could-possibly-go-wrong-5a726e889864)

### 🌍 Multilingual Audio Pipeline

A walkthrough of a multilingual AWS pipeline using Amazon Transcribe, Translate, Polly, Lambda, S3, and CloudWatch.

📖 [Read on Medium](https://medium.com/@mandymreed/teaching-the-cloud-to-speak-every-language-df07b5764134)

---

# 🚀 What I'm Focusing On Next

Terraform, Docker Swarm, and Kubernetes have officially graduated from **“things I need to learn”** to **“things I've built with.”** 🎓😅

Kubernetes in particular has now progressed through several layers of hands-on learning:

```text
Kubernetes Fundamentals
        ↓
Multi-Tier Application
        ↓
Application Troubleshooting
        ↓
Amazon EKS
        ↓
Cloud-Hosted Kubernetes
```

Moving Kubernetes into AWS helped connect my existing cloud experience with the container orchestration concepts I had been practicing locally.

My next areas of focus include:

* Microsoft Azure
* Cloud security
* Monitoring and alerting
* Site Reliability Engineering
* Kubernetes observability
* Kubernetes configuration and secrets management
* Deployment automation

Kubernetes is not disappearing from the roadmap.

The Fundamentals project established the foundation, the WordPress + MySQL project expanded that foundation into a multi-tier application, and Amazon EKS moved those concepts into AWS-managed infrastructure with cloud networking, load balancing, ECR, autoscaling, monitoring, and versioned application releases.

Future Kubernetes work can build from there through deeper observability, configuration and secrets management, deployment automation, and more advanced cloud-native application architectures.

As I complete hands-on projects in these areas, they will continue making their way into the portfolio.

---

# 💼 Professional Background

I have 18 years of experience supporting users in enterprise IT environments and 21 years with Allstate.

My background includes technical support, troubleshooting, customer service, documentation, incident management, problem-solving, and supporting business-critical technology.

I am expanding that experience into cloud engineering through hands-on projects involving AWS, Amazon EKS, Amazon ECR, Terraform, Infrastructure as Code, Linux, Docker, Docker Swarm, Kubernetes, multi-tier applications, container orchestration, Amazon EFS, Jenkins, automation, monitoring, CI/CD, serverless technologies, autoscaling, and cloud operations.

The technologies are changing, but one part has stayed very familiar:

**Something isn't working. Figure out why. 🔎**

---

# 🔧 Portfolio Troubleshooting & Lessons Learned

Building and maintaining this portfolio has involved real troubleshooting rather than following a perfectly successful deployment path.

A few examples:

* Diagnosed a Git push failure caused by a repository that had not yet been created
* Identified CloudFront caching when GitHub and S3 contained updated content but the live website continued displaying the previous version
* Used CloudFront cache invalidation to refresh deployed website content
* Troubleshot an initial Route 53 domain registration failure
* Configured the Route 53 hosted zone
* Used DNS validation for an ACM TLS certificate
* Configured HTTPS for both the root domain and `www` subdomain
* Added alternate domain names to CloudFront
* Created Route 53 A and AAAA alias records
* Learned how DNS, TLS, CloudFront, S3, source control, and the live website fit together

These experiences are an important part of the project because understanding the complete path makes troubleshooting much more effective.

---

# 🔮 What's Next for the Portfolio?

The portfolio will continue evolving as my skills and projects grow.

Future improvements may include:

* Automated portfolio deployment with GitHub Actions
* Terraform-managed portfolio infrastructure
* Microsoft Azure projects
* Deeper Kubernetes observability
* Kubernetes configuration and secrets management
* Kubernetes deployment automation
* Additional monitoring and alerting
* New cloud architecture visualizations
* More hands-on cloud and DevOps projects

---

# 🔗 Connect With Me

🌐 **Portfolio:** [mandyreed.com](https://mandyreed.com)

💻 **GitHub:** [github.com/mandyreed223](https://github.com/mandyreed223)

💼 **LinkedIn:** [linkedin.com/in/mandymreed](https://www.linkedin.com/in/mandymreed/)

✍️ **Medium:** [medium.com/@mandymreed](https://medium.com/@mandymreed)

---

## 👩‍💻 Mandy Reed

Enterprise IT professional building hands-on cloud and DevOps engineering experience through AWS, Amazon EKS, Terraform, Infrastructure as Code, Linux, Docker, Kubernetes, container orchestration, persistent storage, autoscaling, monitoring, automation, troubleshooting, and technical writing.

☁️ **Build it. Troubleshoot it. Understand it. Then build something harder.** 🚀
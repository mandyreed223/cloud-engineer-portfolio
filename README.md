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

The portfolio has continued to grow alongside my technical skills and now showcases work involving AWS, Terraform, Infrastructure as Code, Linux, Docker, Docker Swarm, container orchestration, Amazon EFS, Jenkins, CI/CD, automation, IAM, serverless technologies, persistent storage, and cloud troubleshooting.

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
* Overlay Networking
* Persistent Volumes
* Jenkins
* Dockerfiles
* Git
* GitHub
* GitHub Actions
* CI/CD

### Applications & Data

* WordPress
* MySQL
* Shared File Storage
* NFS
* Persistent Application Data

---

# 💻 Featured Cloud & DevOps Projects

These are the projects where I get to build things, troubleshoot them, figure out why they broke, and occasionally wonder why I thought making the architecture more complicated was a good idea. 😅

## ✨ 🐳 WordPress + MySQL Docker Swarm on AWS

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

### 🔐 Secure It, Then Prove It

Least privilege is more meaningful when I test the permissions and verify that the application can do exactly what it needs.

### ♻️ Design for Failure

Container orchestration became much easier to understand when I deliberately started removing containers and workers.

If the actual state no longer matches the desired state, the orchestrator should recognize it and respond. Watching that happen is a much better lesson than simply reading about self-healing.

### 💾 Persistent Data Changes Everything

Containers can disappear and be recreated. Application data cannot be treated the same way.

Adding WordPress, MySQL, Docker Secrets, and Amazon EFS forced me to think beyond whether a container was running and start considering where data lives, which nodes can access it, what happens when workloads move, and how storage affects application recovery.

### 🧩 The Problem May Be Somewhere Else

A container problem is not always a Docker problem.

During the WordPress Swarm project, troubleshooting crossed Docker, Linux, AWS Security Groups, networking, memory, storage, SSH, and the application itself.

Understanding the entire path matters.

### 🧹 Clean Up Counts Too

Building cloud resources is fun. Knowing how to safely tear them down is part of understanding the full lifecycle.

---

# ✍️ Project Stories & Technical Writing

Building the project is only half the story.

I also document what happened along the way: the troubleshooting, mistakes, lessons learned, and occasional **“why is THAT happening?”** moments. 😅

These articles focus less on simply listing technologies and more on explaining what I built, what went wrong, how I troubleshot it, and what I learned from the experience.

## 🐳 WordPress + MySQL Docker Swarm

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

### 🌐 AWS Cloud Engineering Portfolio

A behind-the-scenes look at building and deploying this cloud engineering portfolio, including the deployment, caching, DNS, and custom domain issues I troubleshot along the way.

📖 [Read on Medium](https://medium.com/@mandymreed/so-i-decided-i-needed-a-portfolio-website-what-could-possibly-go-wrong-5a726e889864)

### 🐳 Docker + Apache: It Worked On My Machine... Until It Didn't

A Docker troubleshooting story about containers, local environments, consistency, and learning why repeatable environments matter.

📖 [Read on Medium](https://medium.com/@mandymreed/it-worked-on-my-machine-until-it-didnt-3d2df233c995)

### 🌍 Multilingual Audio Pipeline

A walkthrough of a multilingual AWS pipeline using Amazon Transcribe, Translate, Polly, Lambda, S3, and CloudWatch.

📖 [Read on Medium](https://medium.com/@mandymreed/teaching-the-cloud-to-speak-every-language-df07b5764134)

---

# 🚀 What I'm Focusing On Next

Terraform and Docker Swarm have officially graduated from **“things I need to learn”** to **“things I've built with.”** 🎓😅

My next areas of focus include:

* Microsoft Azure
* Kubernetes fundamentals
* Cloud security
* Monitoring and alerting
* Site Reliability Engineering

As I complete hands-on projects in these areas, they will continue making their way into the portfolio.

---

# 💼 Professional Background

I have 18 years of experience supporting users in enterprise IT environments and 21 years with Allstate.

My background includes technical support, troubleshooting, customer service, documentation, incident management, problem-solving, and supporting business-critical technology.

I am expanding that experience into cloud engineering through hands-on projects involving AWS, Terraform, Infrastructure as Code, Linux, Docker, Docker Swarm, container orchestration, Amazon EFS, Jenkins, automation, monitoring, CI/CD, serverless technologies, and cloud operations.

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
* Kubernetes-focused projects
* Additional monitoring and deployment automation
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

Enterprise IT professional building hands-on cloud and DevOps engineering experience through AWS, Terraform, Infrastructure as Code, containerization, orchestration, persistent storage, automation, troubleshooting, and technical writing.

☁️ **Build it. Troubleshoot it. Understand it. Then build something harder.** 🚀
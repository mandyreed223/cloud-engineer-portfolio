# ☁️ Cloud Engineering Portfolio

A personal cloud engineering portfolio showcasing hands-on AWS projects, cloud technologies, troubleshooting, technical writing, and continuous learning.

This portfolio brings together my enterprise IT experience with the cloud engineering skills I am developing through practical projects and real-world troubleshooting.

## 🚀 Live Website

🌐 [mandyreed.com](https://mandyreed.com)

The portfolio is available through a custom domain configured with Amazon Route 53 and secured with an AWS Certificate Manager (ACM) TLS certificate.

## 🏗️ Portfolio Architecture

The portfolio is built with HTML and CSS, maintained in GitHub, stored in Amazon S3, and delivered securely through Amazon CloudFront using a custom domain managed with Amazon Route 53.

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

AWS Certificate Manager (ACM) provides the TLS certificate used by CloudFront to securely serve both `mandyreed.com` and `www.mandyreed.com` over HTTPS.

Source code and version history are maintained in GitHub.

## 👋 About This Project

This project serves as the central hub for my cloud engineering work, technical writing, professional background, and continued technical development.

The website was built using HTML and CSS, stored in Amazon S3, delivered through Amazon CloudFront, and connected to a custom domain using Amazon Route 53 and AWS Certificate Manager.

Beyond simply deploying a website, this project has provided hands-on experience with cloud infrastructure, DNS, TLS certificates, content delivery, HTTPS, caching, deployment troubleshooting, Git version control, and technical documentation.

One of my goals with this portfolio is to demonstrate not only the technologies I have worked with, but also how I approach problems: understanding how services connect, troubleshooting failures, documenting what I learn, and improving the environments I build.

## ✨ Features

- Professional cloud engineering portfolio website
- Custom `mandyreed.com` domain
- HTTPS/TLS secured website
- Route 53 DNS routing
- CloudFront content delivery
- About Me and professional background
- Cloud skills and technologies
- Cloud career focus areas
- Current learning and development roadmap
- AWS portfolio architecture
- Featured cloud project showcase
- Technical writing showcase
- GitHub, LinkedIn, and Medium integration
- Responsive design for desktop and mobile devices

## 🛠️ Technologies Used

### Frontend

- HTML5
- CSS3
- Responsive web design

### AWS Services

- Amazon S3
- Amazon CloudFront
- Amazon Route 53
- AWS Certificate Manager (ACM)

### Development Tools

- Git
- GitHub
- Visual Studio Code

## 🧠 Skills Demonstrated

- Amazon S3 website storage and hosting
- Amazon CloudFront content delivery
- Amazon Route 53 DNS configuration
- Custom domain configuration
- DNS record management
- AWS Certificate Manager certificate provisioning
- DNS certificate validation
- HTTPS/TLS website delivery
- CloudFront alternate domain configuration
- CDN caching and cache invalidation
- Cloud architecture fundamentals
- Website deployment
- Deployment troubleshooting
- Git version control
- GitHub repository management
- Technical documentation
- Front-end web development
- Responsive web design

## ☁️ Cloud Skills Featured

These technologies represent cloud and development tools I have practiced through hands-on projects:

- AWS
- Amazon EC2
- Amazon S3
- Amazon CloudFront
- Amazon Route 53
- AWS Certificate Manager
- AWS Lambda
- AWS IAM
- Amazon DynamoDB
- Amazon API Gateway
- Amazon CloudWatch
- Amazon Bedrock
- Amazon Rekognition
- Amazon Polly
- Amazon Transcribe
- Amazon Translate
- Linux
- Docker
- Git
- GitHub
- GitHub Actions
- CI/CD

## 💻 Featured Projects

### ☁️ AWS Cloud Engineering Portfolio

Designed and deployed this cloud engineering portfolio using Amazon S3, CloudFront, Route 53, and AWS Certificate Manager.

Configured a custom domain with DNS routing and HTTPS/TLS, maintained source control through GitHub, and performed hands-on troubleshooting involving deployment, caching, DNS, domain registration, HTTPS, and content delivery.

🌐 [View Live Portfolio](https://mandyreed.com)

💻 [View Repository](https://github.com/mandyreed223/cloud-engineer-portfolio)

### 🤖 Prompt Deployment Pipeline

Built a CI/CD-style workflow using GitHub, Amazon S3, and Amazon Bedrock.

[View Repository](https://github.com/mandyreed223/prompt-deployment-pipeline)

### 🌎 Multilingual Audio Pipeline

Created an AWS pipeline using Amazon Transcribe, Amazon Translate, Amazon Polly, AWS Lambda, and Amazon S3.

[View Repository](https://github.com/mandyreed223/multilingual-audio-pipeline)

### 👁️ Rekognition Image Labeling Pipeline

Built an image-processing workflow using Amazon Rekognition, Amazon DynamoDB, AWS Lambda, and Amazon S3.

[View Repository](https://github.com/mandyreed223/rekognition-image-labeling-pipeline)

### 🔊 Polly Text-to-Speech API Pipeline

Created a serverless text-to-speech solution using Amazon Polly, AWS Lambda, Amazon API Gateway, and Amazon S3.

[View Repository](https://github.com/mandyreed223/polly_text_to_speech_pipeline)

### 🌐 Static Website Pipeline

Built and deployed a static website using Amazon S3, Amazon CloudFront, and AWS CodePipeline.

[View Repository](https://github.com/mandyreed223/static_website_pipeline_project)

### ✅ Required Files Checker

Created a GitHub Actions workflow that validates required repository files and logs results to Amazon CloudWatch.

[View Repository](https://github.com/mandyreed223/file_checker_project)

## ✍️ Technical Writing

In addition to building cloud projects, I document lessons learned, troubleshooting experiences, and project walkthroughs through technical writing.

### 🌐 So I Decided I Needed a Portfolio Website... What Could Possibly Go Wrong?

A behind-the-scenes look at building and deploying this cloud engineering portfolio with Amazon S3, CloudFront, and GitHub, including deployment and caching issues I troubleshot along the way.

[Read on Medium](https://medium.com/@mandymreed/so-i-decided-i-needed-a-portfolio-website-what-could-possibly-go-wrong-5a726e889864)

### 🐳 It Worked On My Machine... Until It Didn't

A Docker-focused troubleshooting story exploring containers, local environments, consistency, and lessons learned.

[Read on Medium](https://medium.com/@mandymreed/it-worked-on-my-machine-until-it-didnt-3d2df233c995)

### 🌍 Teaching the Cloud to Speak Every Language

A walkthrough of a multilingual AWS pipeline using Amazon Transcribe, Translate, Polly, Lambda, S3, and CloudWatch.

[Read on Medium](https://medium.com/@mandymreed/teaching-the-cloud-to-speak-every-language-df07b5764134)

## 🚀 Current Focus Areas

I am continuing to expand my cloud engineering skills in:

- Terraform
- Infrastructure as Code (IaC)
- Kubernetes fundamentals
- Cloud security
- Monitoring and alerting
- Site Reliability Engineering (SRE)

As I complete hands-on projects in these areas, they will be added to the portfolio.

## 💼 Professional Background

I have 18 years of experience supporting users in enterprise IT environments and 21 years with Allstate.

My background includes technical support, troubleshooting, customer service, documentation, incident management, problem-solving, and supporting business-critical technology.

I am expanding that experience into cloud engineering through hands-on projects involving AWS, Linux, Docker, automation, monitoring, CI/CD, serverless technologies, and cloud operations.

## 🔧 Troubleshooting & Lessons Learned

Building and expanding this portfolio has included troubleshooting real deployment and cloud infrastructure issues rather than simply following a successful deployment path.

Examples include:

- Diagnosing a Git push failure caused by a repository that had not yet been created
- Identifying CloudFront caching when updated content existed in GitHub and S3 but the live website continued displaying the previous version
- Using CloudFront cache invalidation to refresh deployed website content
- Troubleshooting an initial Route 53 domain registration failure
- Completing domain registration and configuring the Route 53 hosted zone
- Using DNS validation to validate an ACM TLS certificate
- Configuring an ACM certificate for both the root domain and `www` subdomain
- Adding custom alternate domain names to an existing CloudFront distribution
- Creating Route 53 A and AAAA alias records to route the custom domain to CloudFront
- Understanding the relationship between DNS, TLS certificates, content delivery, object storage, source control, and the live website

These experiences are an important part of the project because troubleshooting and understanding the complete path of a request are key areas I am continuing to develop as I move further into cloud engineering.

## 🔮 Future Enhancements

- Automated portfolio deployments using GitHub Actions
- Infrastructure as Code deployment using Terraform
- Kubernetes-focused projects
- Additional cloud projects and certifications
- Enhanced cloud architecture visualizations
- Continued improvements to monitoring and deployment automation

## 🔗 Connect With Me

### 🌐 Portfolio

[mandyreed.com](https://mandyreed.com)

### GitHub

[github.com/mandyreed223](https://github.com/mandyreed223)

### LinkedIn

[linkedin.com/in/mandymreed](https://www.linkedin.com/in/mandymreed/)

### Medium

[medium.com/@mandymreed](https://medium.com/@mandymreed)

## 👩‍💻 Author

**Mandy Reed**

IT Support Professional building hands-on cloud engineering experience through AWS projects, troubleshooting, automation, technical writing, and continuous learning.
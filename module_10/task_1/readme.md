# Task 1: Investigate IaC tools

## 1 Investigation of local management of Docker Compose

Investigated

## 2 Investigation of build and automation tools

Comparison of CI tools is provided in the table below.

| Aspect for comparison                   | GitLab                                   | AWS CodeBuild                                                   |
|-----------------------------------------|------------------------------------------|-----------------------------------------------------------------|
| Type of Product                         | SaaS / On Premise                        | SaaS                                                            |
| Offers a free plan                      | Yes                                      | Yes (only for the 1-st year of service)                         |
| Predictable pricing                     | Yes                                      | Yes (but price is can vary depending on commits to the project) |
| Support                                 | Yes                                      | Yes                                                             |
| Parrallelism                            | Yes (easily configured in gitlab-ci.yml) | Yes (with Batch option)                                         |
| Distributed builds (horizontal scaling) | Yes                                      | Yes                                                             |
| Containers support                      | Yes (Docker is integrated by default     | Yes (builds run in isolated envs)                               |
| Analytics                               | Yes                                      | Yes                                                             |
| Self-hosted option                      | Yes                                      | No                                                              |
| Hosted plans                            | Yes                                      | Yes                                                             |
| Build pipelines                         | Yes (defined in YML config files)        | Yes (via CodePipeling - another payed service)                  |
| Reports                                 | Yes                                      | Yes (allows integration with CloudWatch)                        |
| Ecosystem                               | Yes                                      | Yes                                                             |
| Language support                        | Any (via Docker images)                  | Golang, Java, NodeJS, PHP, Python, Ruby                         |
| 3-rd party integration                  | Yes | Yes                                                             | 
| API | Yes | Yes                                                             |

Conclusion: 
1. CodeBuild easier to integrate in Amazon solution.
2. CodeBuild is better when commits are not frequent, as pay-as-you-go payment policy
3. GitLab is better for on premise code build (e.g. for security reason)
4. GitLab is better for startup, because of free version and more predictable payment.

## 3 Investigation of infrastructure management (IaC) tools

### AWS Cloud Formation vs AWS CDK

**CloudFormation Pros:**
1. Basic AWS technology. Integrated into multiple AWS DevOps features including CodeBuild and CodePipeline
2. Handles parallelization and sequencing (if services are independent). Dependencies can be specified with `DependsOn` prop

**CloudFormation Cons:**
1. Specific JSON/YAML syntax requires time to learn
2. Some errors will not be caught before runtime because the declarative syntax and lack of type checking

**CDK Props:**
1. There is a possibility to use familiar programming language instead of JSON/YAML
2. Provides more structured reusable format (three-tiered reuse level of components: basic/intent/pattern)
3. There is a testing framework to test the validity of 
   - values generated in CloudFormation
   - snapshot diffs against previous version

**CDK Cons:**
1. Requirement to be already "moderate or highly" experienced in CloudFormation
2. Limited language support: Typescript, Javascript, Python, Java, C#, Go
3. Generates a CloudFormation that can be difficult to debug

### AWS Cloud Formation vs HashiCorp Terraform

| Aspect for comparison | Terraform | CloudFormation                                                                                                                                            |
|---|----|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Code Syntax | JSON/YAML/HCS  (HashiCorp Syntax) | JSON/YAML                                                                                                                                                 |
| Dynamic Features | Provides `count` and `for_each` functionality for dynamic resource creation | To create resources repeatedly they need to be explicitly defined again                                                                                   |
| Usable Functions | A rich set of numeric, string, encoding, date/time, filesystem functions | Limited set of 15 intrinsic functions. Ff you need a date/time function I need to create a custom resource that calls a lambda that returns data you need |
| State Management | By default the state file is stored locally, but can be stored in Terraform Cloud | No configuration required |
| Cloud Providers | Cloud provider agnostic | Only for AWS cloud |
| Pricing | - **Free** - up to 500 resources per month <br /> - **Standard** - $0.00014 per hour per resource <br /> - **Plus** - custom <br /> - **Enterprise** - custom | - **Free** tier - 1000 operations/month per account <br/> - **Handler operation** - $0.0009 per handler operation <br/> - **Handler operation** duration - $0.00008 per second if an operation is longer than 30 sec |


## 4 Comparison tables

Due to a lot of compared aspects, the comparison tables are provided in the 2nd abd 3rd sections.


## 5 Choice of tools for the project

For my project (a startup) **GitLab** is the best build automation tool, due to next reasons:
- the code it will be actively developed (a lot of small commits/merges) for a short time period
- the team will take benefit of free version, then in time it will be upgraded to Premium

For my project **Terraform** is the best IaC tool due to next reasons:
- it is cloud provider agnostic
- rich set of intrinsic functions
- functionality for dynamic resource creation

# WEEK 8 (Assigned: FRI 5/1/26 - Due: THU 5/7/26) ASSIGNMENTS

## Readings, Videos, and Labs

### Udemy

- Masterclass: Section 11
- Terraform: Section 7

### Books

#### Packt

- Review chapter 4 on:
  - instance groups
  - templates
  - autohealing
  - autoscaling
  - if needed (this section was previously assigned)

- Chapter 10

#### Terraform

- Chapters 3-4

---

## Documentation

### Instance Groups

- https://docs.cloud.google.com/compute/docs/instance-groups#managed_instance_groups
- https://cloud.google.com/instance-groups?hl=en

### Load Balancing

- https://cloud.google.com/load-balancing?hl=en
- https://docs.cloud.google.com/load-balancing/docs/application-load-balancer
- https://docs.cloud.google.com/load-balancing/docs/https
- https://docs.cloud.google.com/load-balancing/docs/application-load-balancer#three-tier_web_services
- https://levelup.gitconnected.com/load-balancing-on-google-cloud-platform-gcp-why-and-how-a8841d9b70c

### Solutions Architecture

- https://docs.cloud.google.com/architecture/infra-reliability-guide/design

---

# Deliverables

- Use your normal HW github repo to submit this.
- Include all documentation and resources you used, and how you used it and be specific.
- Add a readme of some kind for this week.

For all questions and documentation assume I am a junior employee new to cloud infrastructure. Assume I have some technical knowledge but you will be covering these concepts from the ground up.

---

# Q & A

Answer the following questions in a section called “Q & A”:

- Each bullet point can be between 1-5 sentences.
- You choose the amount of detail as long as I see that you understand it.

### Questions

- What is the difference between high availability and fault tolerance?
- Which is best to strive for?

- Explain the difference between autoscaling and elasticity.
- What is vertical and horizontal autoscaling?
- Is one better?
- Are they feasible on prem?

- Explain what the difference between managed and unmanaged instance groups is.

- Explain the different use cases for health checks used by applications (in instance groups) and health checks used by load balancers.
- Can they be the same?
- Are they different API calls?
- Should they be the same?

- Explain in a few sentences what the 3 tier architecture is and how it relates to what you are learning.

---

# Runbook

In a section called “runbook”:

- In the first few sentences (3 max) explain the end goal.

### Add a section on prerequisites

What do I, as an engineer, need to have ready to make this happen?

### Goal

A fully configured managed instance group created via ClickOps

### Include

- Explain how to enable autoscaling and autohealing
- Explain how to verify that the instance group will manage instances across multiple zones
- Explain any other critical config explicitly

### Notes

- Remember this is for other engineers so no need to try to explain everything like I am a nontechnical person.
- Also keep in mind runbooks are not for learning but for executing something properly.
- Keep it pretty high level.
- Use whatever amount of detail you feel is correct.

### Validation

- Test it by having a group mate use this runbook to accomplish the goal.
- They should be able to rely on it only to spin up a properly configured instance group.

---

# Terraform

In a section called “terraform”:

- Explain the mandatory (required) arguments for a VM in terraform

- Explain how to output the internal and external IP addresses of the provisioned VM and how you figured this out

- Choose 2 non-required arguments and give an explanation for both
  - do not copy and paste the reference material

- Explain how you would figure out the correct format for creating a VM with the “centOS stream 10” image
  - the specific image is up to you

- Explain the difference between the “name” argument and the computed “id” and “self_link” attributes

---

# Terraform Subdirectory Requirements

In a subdirectory called `terraform`

## Required

- A `.gitignore` file
  - ask group leader if unsure

---

# Critical Requirements

- No state file can be committed to your repo
- No provider binaries (`.terraform dir`) if you somehow figure out Git LFS
- Your code must be able to be cloned and ran (`terraform init`, `validate`, `apply`) as is

### Submission is not acceptable without meeting these

---

# Terraform Config Requirements

A terraform config conforming to best practices

## This includes

- `Terraform {}` code block
  - ideally this has versioning requirements for the terraform binary of at least 1.10

- `Provider {}` code block
  - latest provider version

- Comments where needed to make config self-documenting

- Follow style guide for naming conventions

- Idiomatic formatting
  - hint: there is a command for this

- Files separated in a logical manner and numbered

- Resources must logically build on each other

- No unneeded explicit dependencies

---

# VM Requirements

The Terraform config must provision a VM

## VM must:

- Have an external IP
- Use the “centOS stream 10” OS image
- The root persistent disk must be 100 GB
- Must be a machine type in the N series
  - you choose

---

# Startup Script

For the startup script use the following script

- Put the script in the startup script argument however you like

### Notes

- Startup scripts Theo has provided will not work because CentOS is a flavor of RHEL so some commands are slightly different
- Feel free to look at the script, I added some simple comments to understand it

### Command to get script

```bash
curl -o startup.sh https://raw.githubusercontent.com/aaron-dm-mcdonald/class7.5-notes/refs/heads/main/week-8/hw/startup-for-rhel.sh
```

---

# Networking Requirement

Put it in the default vpc (or do the BAM, see below)) and use this argument too:

```hcl
tags = ["http-server"]
```

or port 80 will not open unless you make a separate firewall rule
- either is fine
- the former option is easiest

### Important

- Do not include unneeded arguments

---

# Outputs

The terraform config must include output for:

- the internal IP addresses of the VM
- the external IP addresses of the VM
- the `name`
- `id`
- `self_link` attributes

---

# Be a man 1

Expand the existing VM

## Requirements

- Write terraform config for your own:
  - VPC
  - subnet
  - firewall

- Write the output for both IP addresses using only one output code block and explain:
  - what it is
  - how you did this

- Remove the:

```hcl
tags = ["http-server"]
```

argument value but keep the:

```hcl
tags = []
```

argument and add a tag to your custom firewall rule

---

# Be a man 2

Expand BAM1 but:

- write a VM template resource
- use it to provision the VM
- all with terraform

## Requirement

- Document how you solved this carefully
# Managed Instance Group Runbook

## Goal

Engineer level ClickOps instructions for deploying a properly configured Managed Instance Group with autoscaling, autohealing, and multi-zone deployment in GCP.

---

## Prerequisites

Before starting, make sure you have:

- access to a GCP project with Compute Engine enabled
- permissions to create:
  - VM instances
  - instance templates
  - instance groups
  - health checks
- a startup script ready
- HTTP firewall access enabled
- selected deployment region and zones

---

## Create Instance Template

- go to:
  - Compute Engine -> Instance templates

- click:
  - Create instance template

- configure:
  - machine type
  - boot disk image
  - startup script
  - networking
  - firewall rules

- enable:
  - Allow HTTP traffic

- go to:
  - Advanced options -> Management -> Automation

- paste startup script into:
  - Startup script

- create the template

- verify:
  - startup script works correctly
  - external IP loads in browser

---

## Create Managed Instance Group

- go to:
  - Compute Engine -> Instance groups

- click:
  - Create instance group

- configure:
  - Managed instance group
  - instance template
  - desired instance count
  - multiple zones

- select multiple zones in the region for higher availability

---

## Configure Autoscaling

- enable autoscaling

- configure:
  - minimum instance count
  - maximum instance count
  - target CPU utilization

- verify autoscaling policy is attached after deployment

---

## Configure Autohealing

- create or attach a regional health check

- enable:
  - logging

- verify:
  - unhealthy instances automatically recreate
  - instances eventually return healthy

---

## Verify Multi-Zone Deployment

- verify instances are distributed across multiple zones

- verify:
  - group health becomes healthy
  - instances recover properly
  - HTTP traffic responds successfully

---

## Final Validation

Before considering deployment complete, verify:

- startup script executed successfully
- external IP loads successfully
- autoscaling enabled
- autohealing enabled
- health checks healthy
- instances distributed across multiple zones
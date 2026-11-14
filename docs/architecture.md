# Architecture

## Purpose

The workload exists only to create enough infrastructure relationships for the
Terraform structure to become interesting.

It is deliberately not a product architecture.

## Runtime

```text
Internet
   ↓
Application Load Balancer
   ↓
ECS Fargate task
   ↓
NGINX
```

The task writes container logs to CloudWatch Logs.

## Network

One VPC contains two public subnets in different Availability Zones.

The ALB is internet-facing.

The ECS service also uses the public subnets and assigns a public IP to the
task. This avoids NAT Gateway cost for the reference.

The task security group does not allow arbitrary inbound internet traffic.
Application traffic is allowed only from the ALB security group.

## Why this workload?

It has several natural responsibilities:

```text
network
edge
runtime
identity
observability
```

That makes it possible to demonstrate an important distinction:

```text
AWS resource type != architectural boundary
```

A module per resource type can look organized while making ownership and change
relationships harder to see.

## Deployment lifecycle

The intended verification path for each stage is:

```text
fmt
→ validate
→ plan
→ apply
→ HTTP smoke test
→ inspect plan after no changes
→ destroy
```

The three stages should preserve application behavior while changing only the
Terraform structure.

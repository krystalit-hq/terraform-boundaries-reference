# Decisions

## Why ECS Fargate?

The reference needs enough infrastructure relationships to make boundaries
visible without turning into another serverless example.

ECS gives us:

- network,
- load balancing,
- runtime,
- identity,
- logging.

That is enough structure to make the Terraform organization meaningful.

## Why NGINX from Public ECR?

Application code is not part of the experiment.

Using a public image removes build and registry lifecycle from the first
version and keeps attention on infrastructure structure.

## Why no NAT Gateway?

A NAT Gateway would add recurring cost and another networking concern without
improving the lesson.

Tasks use public IP addresses for outbound image pulls. Inbound application
traffic is still restricted to the ALB security group.

This is a deliberate reference trade-off, not a recommendation for every
production ECS service.

## Why no ECR repository?

An ECR repository would require a separate image build/push lifecycle before the
ECS service becomes useful.

That would distract from the Terraform boundary experiment.

A future application can own that concern separately if needed.

## Why one large `main.tf` first?

Because stage 01 must be honestly functional before we introduce abstractions.

Starting from a deliberately modular design would hide the actual question:

> Which boundaries are useful, and which ones merely look organized?

## Why no remote state backend?

The state ownership model is outside this experiment.

The repository should not pretend that one backend configuration is universal.

## Why no custom modules in stage 01?

Modules would prematurely answer the question the repository exists to explore.

Stage 02 will introduce them intentionally.

## Why keep the workload unchanged across stages?

If infrastructure behavior changes together with Terraform structure, the
comparison becomes weak.

The strongest experiment changes structure while preserving what gets deployed.

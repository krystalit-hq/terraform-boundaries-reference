# Decisions

## Why three modules?

Not because three is inherently better than ten.

The three modules correspond to responsibilities that have distinct reasons to change:

```text
network
edge
runtime
```

They also create a dependency direction that is easy to explain.

## Why identity lives in runtime

The ECS task execution role exists because the workload needs to start and write logs.

Its lifecycle is tied to the runtime.

Creating an `iam-role` module simply because IAM is a separate AWS service did not create a useful architectural boundary.

## Why CloudWatch Logs lives in runtime

The log group exists for this workload.

It is not a shared observability platform.

Treating it as an independent `log-group` module added an interface without creating independent ownership.

## Why the ALB security group lives in edge

It describes the public ingress policy of the load balancer.

That is part of the edge responsibility.

## Why the ECS security group lives in runtime

It describes what may reach the workload.

It consumes the ALB security group ID from edge, making the dependency direction explicit:

```text
edge → runtime
```

## Why networking remains its own module

Network topology has a coherent lifecycle and is consumed by both edge and runtime.

It provides a stable interface:

- VPC ID
- public subnet IDs

Callers do not need to know which route tables or associations implement that topology.

## Why moved blocks remain in the final repository

They document how the same live infrastructure evolved between stages.

They are part of the experiment's history, not temporary state surgery.

## Why runtime behavior never changes

The comparison is useful only if the workload remains equivalent.

All three stages should continue to serve the same NGINX page through the same ALB and ECS service.

The variable is Terraform structure, not application behavior.

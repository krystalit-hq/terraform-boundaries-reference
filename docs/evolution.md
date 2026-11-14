# Evolution

This repository keeps the runtime workload stable while changing only the Terraform structure.

## Stage 01 — works

```text
1 root module
0 custom modules
```

The configuration was direct and easy to trace at small scale.

It also concentrated unrelated concerns in one place.

The workload deployed successfully and converged to:

```text
No changes.
```

## Stage 02 — abstraction trap

```text
10 custom modules
```

The configuration was split by AWS resource category:

```text
vpc
subnets
routing
security-groups
log-group
iam-role
load-balancer
ecs-cluster
task-definition
ecs-service
```

Every extraction was locally defensible.

Collectively, the modules created many interfaces without introducing clear ownership.

The root module became shorter, but much of it was now glue:

```text
output from module A
→ input to module B
→ output from module B
→ input to module C
```

The infrastructure still worked.

Terraform still returned:

```text
No changes.
```

That was exactly the trap.

## Stage 03 — bounded

```text
3 custom modules
```

The final structure is organized around responsibility and lifecycle:

```text
network
edge
runtime
```

### Network

Owns topology.

It can change internally without requiring the caller to understand individual route tables, subnet associations or internet gateway resources.

### Edge

Owns the public entry point.

The ALB security group, load balancer, target group and listener change as one concern.

### Runtime

Owns the workload.

The ECS service, task definition, execution identity, logging and task-facing security group share the same operational lifecycle.

## What improved

The final design does not optimize for:

```text
fewest files
most modules
shortest root module
maximum reuse
```

It optimizes for:

```text
local reasoning
clear ownership
stable interfaces
visible dependency direction
```

The dependency direction is now intentionally small:

```text
network → edge → runtime
    └────────→ runtime
```

The root module composes those responsibilities instead of reproducing AWS's service catalog.

## Conclusion

The experiment does not prove that:

```text
modules are good
```

or:

```text
modules are bad
```

It demonstrates something narrower:

> A module is useful when it expresses a boundary that matters to the system.

Terraform can enforce the graph after we choose the boundary.

It cannot choose the boundary for us.

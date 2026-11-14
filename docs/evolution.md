# Evolution

## Stage 01 — works

One root module, direct references, no custom modules.

Verified:

```text
HTTP → ALB → ECS Fargate → NGINX
```

Terraform converged to:

```text
No changes.
```

Nothing was technically wrong. That was the point.

## Stage 02 — abstraction trap

The same infrastructure is split into modules based mostly on AWS resource categories:

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

Every individual extraction looks reasonable.

The problem appears only when the system is considered as a whole.

The modules answer:

```text
What AWS resource is this?
```

They do not answer:

```text
What responsibility does this belong to?
What changes together?
Who owns the lifecycle?
```

The root module becomes shorter, but IDs and ARNs now travel through many module interfaces.

> More modules do not automatically mean better boundaries.

## Stage 03 — bounded

The final version will use a much smaller number of responsibility-oriented boundaries, likely around concerns such as:

```text
network
edge
runtime
```

Identity and observability will live where their lifecycle and ownership make sense instead of becoming modules only because AWS exposes separate service names.

The conclusion is not:

```text
modules are bad
```

It is:

> Abstraction is useful when it represents a real boundary. Terraform cannot discover that boundary for us.

# Evolution plan

The repository is an experiment in infrastructure structure.

## Stage 01 — works

Goal:

> Build infrastructure that is valid, deployable and understandable at small
> scale, but has too much shared context.

Characteristics:

- one root module,
- most resources in `main.tf`,
- direct references everywhere,
- no custom modules,
- deployment works.

The important point is that nothing is technically wrong.

## Stage 02 — abstraction trap

Goal:

> Apply a plausible but shallow cleanup: module boundaries based mainly on AWS
> resource types.

Likely modules:

```text
modules/
  vpc/
  security-group/
  log-group/
  iam-role/
  load-balancer/
  ecs-cluster/
  ecs-service/
```

Expected result:

- Terraform still validates,
- infrastructure still works,
- root configuration becomes shorter,
- module interfaces become wider,
- values are passed through layers,
- dependency direction becomes harder to follow,
- ownership is still unclear.

This stage exists to demonstrate:

> More modules do not automatically mean better boundaries.

## Stage 03 — bounded

Goal:

> Organize the same infrastructure around responsibilities and lifecycle.

Possible shape:

```text
infra/
  versions.tf
  providers.tf
  variables.tf
  locals.tf
  network.tf
  edge.tf
  runtime.tf
  identity.tf
  observability.tf
  outputs.tf
```

Custom modules will only remain if a real reusable boundary emerges.

The final structure should make these questions easier to answer:

- who owns this concern?
- what changes together?
- which direction does the dependency point?
- what context does a reader need before changing it?
- what can be replaced without understanding the entire stack?

## Success criteria

The experiment succeeds if all three versions can describe the same working
system while making the cost of bad abstraction visible.

The final conclusion should not be:

```text
modules are bad
```

or:

```text
flat Terraform is always better
```

It should be:

> Abstraction is useful when it represents a real boundary. Terraform cannot
> discover that boundary for us.

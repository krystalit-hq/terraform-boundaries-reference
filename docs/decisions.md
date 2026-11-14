# Decisions

## Why stage 02 has many modules

Because this is a common cleanup pattern:

```text
large file
→ extract resources
→ create modules
→ root file gets shorter
→ declare victory
```

Stage 02 intentionally tests whether that cleanup actually reduces the context required to understand a change.

The modules are not broken.

They are shallow.

Most represent AWS resource categories rather than architectural responsibilities.

## Why use moved blocks

The experiment is about code organization, not rebuilding the workload.

Terraform `moved` blocks preserve the existing AWS objects while their Terraform addresses move from the root module into child modules.

This also documents migration intent in code instead of relying on manual `terraform state mv` commands.

## Why keep runtime behavior unchanged

If infrastructure behavior changes together with Terraform structure, the comparison becomes weak.

The strongest experiment changes structure while preserving what gets deployed.

# Applying Stage 03

Stage 02 created ten local module directories.

Before copying this overlay, remove them:

```powershell
Remove-Item -Recurse -Force .\infra\modules
```

Then copy the contents of this overlay into the repository root.

Run:

```powershell
make init
make fmt
make check
make plan
```

Do not apply if Terraform proposes real create/change/destroy operations.

The expected migration is address moves only:

```text
Plan: 0 to add, 0 to change, 0 to destroy.
```

After applying the moves:

```powershell
make apply
curl.exe "$(terraform -chdir=infra output -raw alb_url)"
make plan
```

The final plan should return:

```text
No changes.
```

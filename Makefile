TF_DIR := infra

.PHONY: init fmt fmt-check validate check plan apply destroy-plan destroy output

init:
	terraform -chdir=$(TF_DIR) init

fmt:
	terraform -chdir=$(TF_DIR) fmt -recursive

fmt-check:
	terraform -chdir=$(TF_DIR) fmt -check -recursive

validate:
	terraform -chdir=$(TF_DIR) validate

check: fmt-check validate

plan:
	terraform -chdir=$(TF_DIR) plan

apply:
	terraform -chdir=$(TF_DIR) apply

destroy-plan:
	terraform -chdir=$(TF_DIR) plan -destroy

destroy:
	terraform -chdir=$(TF_DIR) destroy

output:
	terraform -chdir=$(TF_DIR) output

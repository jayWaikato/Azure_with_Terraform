export ARM_SUBSCRIPTION_ID=""

export TF_VAR_application_name="observability"
export TF_VAR_environment_name="dev"

terraform init \
    -backend-config="resource_group_name=rg-project_hail_marry-dev" \
    -backend-config="storage_account_name=st2ccjbpjoz0" \
    -backend-config="container_name=tfstate" \
    -backend-config="key=observability-dev"

terraform $*

rm -rf .terraform

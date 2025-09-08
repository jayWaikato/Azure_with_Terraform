export ARM_SUBSCRIPTION_ID=""

export TF_VAR_application_name="observability"
export TF_VAR_environment_name="prod"

terraform init \
    -backend-config="resource_group_name=rg-project_hail_marry-prod" \
    -backend-config="storage_account_name=stsk48q25jdr" \
    -backend-config="container_name=tfstate" \
    -backend-config="key=observability-prod"

terraform $*

rm -rf .terraform

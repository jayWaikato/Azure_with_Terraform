export ARM_SUBSCRIPTION_ID="0fcfc3a4-abe4-4a85-82a8-0d37d2a7e02d"

export TF_VAR_application_name="observability"
export TF_VAR_environment_name="prod"

terraform init \
    -backend-config="resource_group_name=rg-project_hail_marry-prod" \
    -backend-config="storage_account_name=stsk48q25jdr" \
    -backend-config="container_name=tfstate" \
    -backend-config="key=observability-prod"

terraform $*

rm -rf .terraform
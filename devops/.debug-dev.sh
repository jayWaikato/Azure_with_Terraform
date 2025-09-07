export ARM_SUBSCRIPTION_ID="0fcfc3a4-abe4-4a85-82a8-0d37d2a7e02d"

export TF_VAR_application_name="devops"
export TF_VAR_environment_name="dev"

terraform init \
    -backend-config="resource_group_name=rg-project_hail_marry-dev" \
    -backend-config="storage_account_name=st2ccjbpjoz0" \
    -backend-config="container_name=tfstate" \
    -backend-config="key=devops-dev"

terraform $*

rm -rf .terraform
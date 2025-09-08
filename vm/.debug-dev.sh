export ARM_SUBSCRIPTION_ID=""

export TF_VAR_application_name="Linuxvm"
export TF_VAR_environment_name="dev"

terraform init \
    -backend-config="resource_group_name=rg-project_hail_marry-dev" \
    -backend-config="storage_account_name=st2ccjbpjoz0" \
    -backend-config="container_name=tfstate" \
    -backend-config="key=Linuxvm-dev"
# terraform state mv azurerm_subnet.example azurerm_subnet.alpha
terraform $* 

rm -rf .terraform

TF_DIR=terraform
AWS_REGION?=us-west-2
TF_STATE_BUCKET?=REPLACE_ME_state_bucket
TF_LOCK_TABLE?=REPLACE_ME_lock_table


init-%:
terraform -chdir=$(TF_DIR) init \
-upgrade \
-backend-config="bucket=$(TF_STATE_BUCKET)" \
-backend-config="key=$*/terraform.tfstate" \
-backend-config="region=$(AWS_REGION)" \
-backend-config="dynamodb_table=$(TF_LOCK_TABLE)"


plan-%: init-%
terraform -chdir=$(TF_DIR) plan \
-var="env_name=$*" \
-var="aws_region=$(AWS_REGION)" \
-var="tf_state_bucket=$(TF_STATE_BUCKET)" \
-var="tf_lock_table=$(TF_LOCK_TABLE)" \
-var-file=../envs/$*.tfvars


apply-%: init-%
terraform -chdir=$(TF_DIR) apply -auto-approve \
-var="env_name=$*" \
-var="aws_region=$(AWS_REGION)" \
-var="tf_state_bucket=$(TF_STATE_BUCKET)" \
-var="tf_lock_table=$(TF_LOCK_TABLE)" \
-var-file=../envs/$*.tfvars


fmt:
terraform -chdir=$(TF_DIR) fmt -recursive


validate:
terraform -chdir=$(TF_DIR) validate
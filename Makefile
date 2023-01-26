all:
	@aws configure list-profiles

tf/init:
	terraform init

tf/plan:
	terraform plan

tf/apply:
	# -auto-approve
	terraform apply

tf/show:
	terraform show

tf/destroy:
	terraform destroy

tf/state/list:
	terraform state list

tf/workspace/select/%:
	terraform workspace select $*

tf/workspace/new/%:
	terraform workspace new $*

tf/workspace/list:
	terraform workspace list
	
profile/%:
	@echo 'export AWS_DEFAULT_PROFILE=$*'

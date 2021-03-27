.PHONY: provision
provision:
	minikube start
	terraform init

.PHONY: apply
apply:
	terraform apply -auto-approve

.PHONY: stop
stop:
	minikube stop

.PHONY: teardown
teardown:
	terraform destroy -auto-approve
	minikube delete

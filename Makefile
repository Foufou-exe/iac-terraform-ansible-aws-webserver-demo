.PHONY: help init plan deploy destroy status backup

help: ## 📖 Afficher l'aide
	@echo "🚀 Commandes disponibles:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

init: ## 🔧 Initialiser Terraform
	cd terraform && terraform init

plan: ## 📋 Voir le plan de déploiement
	cd terraform && terraform plan

deploy: ## 🚀 Déployer l'infrastructure
	cd terraform && terraform apply

destroy: ## 🧹 Détruire l'infrastructure
	cd terraform && terraform destroy

status: ## 📊 Voir le statut des ressources
	cd terraform && terraform show

backup: ## 💾 Lancer le backup
	cd terraform && ansible-playbook -i $(shell terraform output -raw ansible-tm_public_ip):~/ansible/host.ini backup-playbook.yml

# 🚀 Infrastructure AWS automatisée avec Terraform et Ansible

[![Terraform](https://img.shields.io/badge/Terraform-1.0+-purple?logo=terraform)](https://www.terraform.io/)
[![Ansible](https://img.shields.io/badge/Ansible-2.9+-red?logo=ansible)](https://www.ansible.com/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange?logo=amazon-aws)](https://aws.amazon.com/)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/Foufou-exe/iac-terraform-ansible-aws-webserver-demo?style=social)](https://github.com/Foufou-exe/iac-terraform-ansible-aws-webserver-demo/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/Foufou-exe/iac-terraform-ansible-aws-webserver-demo?style=social)](https://github.com/Foufou-exe/iac-terraform-ansible-aws-webserver-demo/fork)
![GitHub repo size](https://img.shields.io/github/repo-size/Foufou-exe/iac-terraform-ansible-aws-webserver-demo)
![GitHub last commit](https://img.shields.io/github/last-commit/Foufou-exe/iac-terraform-ansible-aws-webserver-demo)
![GitHub issues](https://img.shields.io/github/issues/Foufou-exe/iac-terraform-ansible-aws-webserver-demo)
![GitHub pull requests](https://img.shields.io/github/issues-pr/Foufou-exe/iac-terraform-ansible-aws-webserver-demo)
![GitHub Discussions](https://img.shields.io/github/discussions/Foufou-exe/iac-terraform-ansible-aws-webserver-demo)
![GitHub contributors](https://img.shields.io/github/contributors/Foufou-exe/iac-terraform-ansible-aws-webserver-demo)


## 📖 Description / Description

**Français** : Ce projet déploie automatiquement une infrastructure complète sur AWS comprenant un serveur Ansible pour l'orchestration et un serveur Web Apache configuré automatiquement. L'ensemble est provisionnée via Terraform et configurée via Ansible.

**English** : This project automatically deploys a complete AWS infrastructure including an Ansible server for orchestration and an Apache web server configured automatically. Everything is provisioned via Terraform and configured via Ansible.

## 🏗️ Architecture / Architecture

```
┌─────────────────────┐    SSH    ┌─────────────────────┐
│   Ansible Server    │ ────────▶ │   Apache Server     │
│                     │           │                     │
│ • Terraform         │           │ • Apache2           │
│ • Ansible           │           │ • Custom HTML       │
│ • SSH Keys          │           │ • Auto-configured   │
│ • Automation        │           │ • Port 80/443       │
└─────────────────────┘           └─────────────────────┘
         │                                 │
         └─────────────────┬───────────────┘
                           │
                    ┌─────────────┐
                    │  Internet   │
                    │ SSH/HTTP(S) │
                    └─────────────┘
```

## 🎯 Fonctionnalités / Features

### Français

- ✅ **Déploiement automatisé** : Infrastructure complète en une commande
- 🔐 **Sécurité intégrée** : Chiffrement EBS, clés SSH générées automatiquement
- 🌐 **Serveur web prêt** : Apache2 configuré avec page personnalisée
- 📱 **Responsive** : Interface adaptée à tous les écrans
- 🔧 **Orchestration** : Ansible pour la gestion de configuration
- 💰 **Free Tier compatible** : Utilise les ressources gratuites AWS
- 📊 **Monitoring** : Logs et statuts intégrés
- 🧹 **Cleanup automatique** : Destruction propre des ressources

### English

- ✅ **Automated deployment** : Complete infrastructure in one command
- 🔐 **Built-in security** : EBS encryption, auto-generated SSH keys
- 🌐 **Ready web server** : Apache2 configured with custom page
- 📱 **Responsive** : Interface adapted to all screens
- 🔧 **Orchestration** : Ansible for configuration management
- 💰 **Free Tier compatible** : Uses AWS free resources
- 📊 **Monitoring** : Integrated logs and status
- 🧹 **Auto cleanup** : Clean resource destruction

## 📋 Prérequis / Prerequisites

### 🔧 Outils requis / Required Tools

| Outil / Tool    | Version  | Installation                                        |
| --------------- | -------- | --------------------------------------------------- |
| **Terraform**   | 1.0+     | [Download](https://www.terraform.io/downloads.html) |
| **Git**         | Latest   | [Download](https://git-scm.com/downloads)           |
| **SSH Client**  | Built-in | Included in OS                                      |
| **AWS Account** | Active   | [Sign up](https://aws.amazon.com/free/)             |

### 💻 Installation par OS / OS Installation

#### Windows (PowerShell as Administrator)

```powershell
# Install Chocolatey package manager / Installer le gestionnaire de paquets Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install required tools / Installer les outils requis
choco install terraform git -y
```

#### Ubuntu/Debian

```bash
# Update system / Mettre à jour le système
sudo apt-get update && sudo apt-get upgrade -y

# Install prerequisites / Installer les prérequis
sudo apt-get install -y gnupg software-properties-common curl

# Add Terraform repository / Ajouter le dépôt Terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

# Install tools / Installer les outils
sudo apt-get update
sudo apt-get install -y terraform git
```

#### macOS (with Homebrew)

```bash
# Install Homebrew if not present / Installer Homebrew si absent
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install required tools / Installer les outils requis
brew install terraform git
```

### 🔐 Configuration SSH / SSH Configuration

#### Générer les clés SSH / Generate SSH Keys

```bash
# Generate new SSH key pair / Générer une nouvelle paire de clés SSH
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"

# Default location: ~/.ssh/id_rsa / Emplacement par défaut : ~/.ssh/id_rsa
# Press Enter for default path / Appuyer sur Entrée pour le chemin par défaut
# Choose passphrase (optional but recommended) / Choisir une phrase de passe (optionnel mais recommandé)
```

#### Vérifier les clés / Verify Keys

```bash
# Check keys exist / Vérifier que les clés existent
ls -la ~/.ssh/
# Expected files / Fichiers attendus : id_rsa (private), id_rsa.pub (public)

# Display public key / Afficher la clé publique
cat ~/.ssh/id_rsa.pub
```

## ☁️ Configuration AWS / AWS Configuration

### 1. Créer les clés d'accès / Create Access Keys

#### Via AWS Console / Via la console AWS

1. **Français** :

   - Connectez-vous à la [Console AWS](https://console.aws.amazon.com/)
   - Allez dans **IAM** → **Utilisateurs** → Votre utilisateur
   - Onglet **Informations d'identification de sécurité**
   - **Créer une clé d'accès** → **Interface de ligne de commande**
   - Notez l'**Access Key ID** et la **Secret Access Key**

2. **English** :
   - Log in to [AWS Console](https://console.aws.amazon.com/)
   - Go to **IAM** → **Users** → Your user
   - **Security credentials** tab
   - **Create access key** → **Command Line Interface**
   - Note the **Access Key ID** and **Secret Access Key**

### 2. Configurer le fichier de variables / Configure Variables File

```bash
# Navigate to project directory / Naviguer vers le répertoire du projet
cd terraform

# Copy template / Copier le modèle
cp terraform.tfvars.example terraform.tfvars

# Edit with your values / Éditer avec vos valeurs
nano terraform.tfvars  # or vim, code, etc.
```

#### Exemple de configuration / Configuration Example

```hcl
# =============================================================================
# AWS CREDENTIALS / IDENTIFIANTS AWS
# =============================================================================
aws_access_key_id     = "AKIAIOSFODNN7EXAMPLE"     # Your AWS Access Key / Votre clé d'accès AWS
aws_secret_access_key = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"  # Your AWS Secret / Votre secret AWS

# =============================================================================
# REGION CONFIGURATION / CONFIGURATION DE RÉGION
# =============================================================================
aws_region = "eu-west-3"  # Paris (recommended for EU) / Paris (recommandé pour l'UE)
# aws_region = "us-east-1"    # Virginia (cheaper) / Virginie (moins cher)
# aws_region = "ap-southeast-1"  # Singapore / Singapour

# =============================================================================
# SSH CONFIGURATION / CONFIGURATION SSH
# =============================================================================
ssh_name_public_key = "id_rsa.pub"  # Public key filename / Nom du fichier de clé publique
ssh_key_name        = "id_rsa"      # Key pair name / Nom de la paire de clés
ssh_user            = "admin"       # Default Debian user / Utilisateur Debian par défaut

# =============================================================================
# INSTANCE CONFIGURATION / CONFIGURATION DES INSTANCES
# =============================================================================
instance_type = "t2.micro"  # Free tier eligible / Éligible au niveau gratuit
disk_size     = 15          # GB (8-30 free) / Go (8-30 gratuit)

# =============================================================================
# CUSTOM NAMING / NOMMAGE PERSONNALISÉ
# =============================================================================
name_machine_prefix = "my-project"  # Custom prefix / Préfixe personnalisé
```

## 🚀 Déploiement / Deployment

### 📥 Étape 1 : Cloner le projet / Step 1: Clone Project

```bash
# Clone repository / Cloner le dépôt
git clone https://github.com/your-username/aws-terraform-ansible.git
cd aws-terraform-ansible/terraform
```

### 🔧 Étape 2 : Initialiser Terraform / Step 2: Initialize Terraform

```bash
# Initialize Terraform workspace / Initialiser l'espace de travail Terraform
terraform init

# Expected output / Sortie attendue :
# Terraform has been successfully initialized!
```

### 📋 Étape 3 : Planifier le déploiement / Step 3: Plan Deployment

```bash
# Review deployment plan / Examiner le plan de déploiement
terraform plan

# This shows what will be created / Ceci montre ce qui sera créé :
# - 2 EC2 instances
# - 3 SSH key pairs
# - 1 Security group
# - Various networking resources
```

### 🚀 Étape 4 : Déployer / Step 4: Deploy

```bash
# Deploy infrastructure / Déployer l'infrastructure
terraform apply

# Type 'yes' when prompted / Taper 'yes' quand demandé
# ⏱️ Deployment time: 5-10 minutes / Temps de déploiement : 5-10 minutes
```

### 📊 Étape 5 : Vérifier les outputs / Step 5: Check Outputs

```bash
# View deployment outputs / Voir les sorties du déploiement
terraform output

# View sensitive outputs / Voir les sorties sensibles
terraform output -json | jq
```

## ✅ Vérification / Verification

### 🌐 Test du serveur web / Web Server Test

```bash
# Get web server IP / Obtenir l'IP du serveur web
WEB_IP=$(terraform output -raw web-apache-tm_public_ip)

# Test HTTP access / Tester l'accès HTTP
curl http://$WEB_IP
# or open in browser / ou ouvrir dans le navigateur
open http://$WEB_IP  # macOS
start http://$WEB_IP  # Windows
```

### 🔐 Test des connexions SSH / SSH Connection Test

```bash
# Connect to Ansible server / Se connecter au serveur Ansible
ANSIBLE_IP=$(terraform output -raw ansible-tm_public_ip)
ssh -i ~/.ssh/id_rsa admin@$ANSIBLE_IP

# Connect to web server / Se connecter au serveur web
WEB_IP=$(terraform output -raw web-apache-tm_public_ip)
ssh -i ~/.ssh/id_rsa admin@$WEB_IP
```

### 🔍 Diagnostic avancé / Advanced Diagnostics

```bash
# Check Apache status / Vérifier le statut d'Apache
ssh -i ~/.ssh/id_rsa admin@$WEB_IP "sudo systemctl status apache2"

# View Apache logs / Voir les logs d'Apache
ssh -i ~/.ssh/id_rsa admin@$WEB_IP "sudo tail -f /var/log/apache2/access.log"

# Check Ansible files / Vérifier les fichiers Ansible
ssh -i ~/.ssh/id_rsa admin@$ANSIBLE_IP "ls -la ~/ansible/"
```

## 🛠️ Personnalisation / Customization

### 🎨 Modifier la page web / Modify Web Page

Éditez le fichier / Edit file : `terraform/ansible/playbook.yml`

```yaml
# Find the "Création d'une page d'accueil personnalisée" task
# Trouvez la tâche "Création d'une page d'accueil personnalisée"
- name: Création d'une page d'accueil personnalisée
  copy:
    content: |
      <!DOCTYPE html>
      <html>
      <head>
          <title>Mon Site Personnalisé</title>
          <!-- Add your custom HTML here -->
          <!-- Ajoutez votre HTML personnalisé ici -->
      </head>
      <body>
          <h1>Bienvenue sur mon site !</h1>
          <!-- Custom content -->
          <!-- Contenu personnalisé -->
      </body>
      </html>
```

### ⚙️ Changer la configuration / Change Configuration

#### Région AWS / AWS Region

```hcl
# In terraform.tfvars / Dans terraform.tfvars
aws_region = "us-west-2"  # Oregon
aws_region = "eu-central-1"  # Frankfurt
aws_region = "ap-northeast-1"  # Tokyo
```

#### Type d'instance / Instance Type

```hcl
# Performance options / Options de performance
instance_type = "t2.nano"    # Minimal (512MB RAM)
instance_type = "t2.micro"   # Standard (1GB RAM) - Free tier
instance_type = "t2.small"   # Enhanced (2GB RAM)
instance_type = "t3.micro"   # Latest generation / Dernière génération
```

#### Taille du disque / Disk Size

```hcl
# Storage options / Options de stockage
disk_size = 8   # Minimum free tier / Minimum niveau gratuit
disk_size = 20  # Recommended / Recommandé
disk_size = 30  # Maximum free tier / Maximum niveau gratuit
```

## 🐛 Dépannage / Troubleshooting

### ❌ Problèmes courants / Common Issues

#### Erreur : "Access Denied" / Error: "Access Denied"

```bash
# Français : Vérifiez vos clés AWS
# English: Check your AWS credentials
terraform plan  # Test credentials / Tester les identifiants

# Solution: Update terraform.tfvars with correct keys
# Solution : Mettre à jour terraform.tfvars avec les bonnes clés
```

#### Erreur : "Key pair not found" / Error: "Key pair not found"

```bash
# Check SSH keys exist / Vérifier que les clés SSH existent
ls -la ~/.ssh/id_rsa*

# Regenerate if missing / Régénérer si manquant
ssh-keygen -t rsa -b 4096 -C "your-email@example.com"
```

#### Timeout de connexion SSH / SSH Connection Timeout

```bash
# Wait for instance to boot / Attendre que l'instance démarre
sleep 120

# Check security group / Vérifier le groupe de sécurité
terraform show | grep -A 10 "security_group"

# Try alternative SSH / Essayer SSH alternatif
ssh -o ConnectTimeout=30 -i ~/.ssh/id_rsa admin@$IP
```

#### Site web inaccessible / Website Inaccessible

```bash
# Check Apache service / Vérifier le service Apache
ssh -i ~/.ssh/id_rsa admin@$WEB_IP "sudo systemctl status apache2"

# Restart Apache / Redémarrer Apache
ssh -i ~/.ssh/id_rsa admin@$WEB_IP "sudo systemctl restart apache2"

# Check ports / Vérifier les ports
ssh -i ~/.ssh/id_rsa admin@$WEB_IP "sudo netstat -tlnp | grep :80"
```

### 🔍 Logs de débogage / Debug Logs

```bash
# Terraform debug mode / Mode debug Terraform
export TF_LOG=DEBUG
terraform apply

# Ansible verbose mode / Mode verbeux Ansible
ssh -i ~/.ssh/id_rsa admin@$ANSIBLE_IP
cd ~/ansible
ansible-playbook -i host.ini playbook.yml -vvv
```

## 🧹 Nettoyage / Cleanup

### ⚠️ Important / Important

**Français** : Pour éviter les frais AWS, supprimez toujours les ressources après les tests.
**English** : To avoid AWS charges, always delete resources after testing.

### 🗑️ Destruction complète / Complete Destruction

```bash
# Destroy all resources / Détruire toutes les ressources
terraform destroy

# Confirm with 'yes' / Confirmer avec 'yes'
# ⏱️ Cleanup time: 2-5 minutes / Temps de nettoyage : 2-5 minutes
```

### 🔍 Vérification du nettoyage / Cleanup Verification

```bash
# List remaining resources / Lister les ressources restantes
terraform show

# Check AWS console / Vérifier la console AWS
# - EC2 Instances should be terminated / Les instances EC2 doivent être terminées
# - Key pairs should be deleted / Les paires de clés doivent être supprimées
# - Security groups should be removed / Les groupes de sécurité doivent être supprimés
```

## 📊 Coûts / Costs

### 💰 Estimation des coûts / Cost Estimation

| Resource / Ressource | Free Tier       | Cost (if exceeded) |
| -------------------- | --------------- | ------------------ |
| **EC2 t2.micro**     | 750 hours/month | $0.0116/hour       |
| **EBS GP3**          | 30GB free       | $0.08/GB/month     |
| **Data Transfer**    | 1GB out/month   | $0.09/GB           |
| **Total Estimated**  | **$0.00**       | **~$5-10/month**   |

### 📈 Optimisation des coûts / Cost Optimization

- ✅ Utilisez `t2.micro` pour rester dans le niveau gratuit
- ✅ Limitez la taille du disque à 30GB maximum
- ✅ Détruisez les ressources après tests
- ✅ Surveillez votre utilisation via AWS Billing

## 🤝 Contribution / Contributing

### 🔀 Comment contribuer / How to Contribute

1. **Fork** le repository
2. **Créez** une branche pour votre fonctionnalité
3. **Committez** vos changements
4. **Poussez** vers la branche
5. **Ouvrez** une Pull Request

### 📝 Guidelines / Directives

- Code commenté en français et anglais
- Tests avant soumission
- Documentation mise à jour
- Respect des conventions Terraform

## 📚 Ressources / Resources

### 📖 Documentation officielle / Official Documentation

- [Terraform Documentation](https://www.terraform.io/docs)
- [Ansible Documentation](https://docs.ansible.com/)
- [AWS Documentation](https://docs.aws.amazon.com/)

### 🎓 Tutoriels / Tutorials

- [Terraform Getting Started](https://learn.hashicorp.com/terraform)
- [Ansible Basics](https://docs.ansible.com/ansible/latest/user_guide/intro_getting_started.html)
- [AWS Free Tier](https://aws.amazon.com/free/)

### 🛠️ Outils utiles / Useful Tools

- [AWS Calculator](https://calculator.aws/) - Calculateur de coûts
- [Terraform Registry](https://registry.terraform.io/) - Modules Terraform
- [Ansible Galaxy](https://galaxy.ansible.com/) - Rôles Ansible

## 📄 Licence / License

Ce projet est sous licence MIT. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## 🎉 Conclusion

**Français** : Félicitations ! Vous avez maintenant une infrastructure AWS complètement automatisée. N'hésitez pas à explorer et modifier le code pour l'adapter à vos besoins.

**English** : Congratulations! You now have a fully automated AWS infrastructure. Feel free to explore and modify the code to fit your needs.

### 📞 Support / Support

- 🐛 **Issues** : [GitHub Issues](https://github.com/Foufou-exe/iac-terraform-ansible-aws-webserver-demo/issues)
- 💬 **Discussions** : [GitHub Discussions](https://github.com/Foufou-exe/iac-terraform-ansible-aws-webserver-demo/discussions)
- 📧 **Email** : thibaut.maurras34@gmail.com

---

**⚡ Happy Infrastructure as Code! / Bonne Infrastructure as Code !** 🚀

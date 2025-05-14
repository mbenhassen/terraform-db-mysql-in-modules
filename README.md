# terraform-db-mysql-in-modules
A Mysql database in terraform module

## 📁 Structure du projet

'''
── main.tf # Appel du module principal
├── variables.tf # Déclaration des variables
├── terraform.tfvars # Valeurs des variables
├── output.tf # Export des informations utiles
└── modules/
├── main.tf # Déploiement de l'instance MySQL
├── variables.tf
└── outputs.tf 
'''

⚙️ Utilisation

1. Cloner le dépôt


git clone https://github.com/mbenhassen/terraform-db-mysql-in-modules.git
cd terraform-db-mysql-in-modules

2. Configurer les variables
Modifier le fichier terraform.tfvars

3. Initialiser et déployer

terraform init
terraform plan
terraform apply

provider "aws" {
    region = var.AWS_REGION
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
}

//Ci-dessous on utilise un même module situé dans ./modules pour déployer plusieurs instances avec des configurations différentes.

// Définition du premier module "instance" utilisant le code situé dans le dossier "./modules"
module "instance" {
    source = "./modules"

    
    db_username = "user"
    db_name = "BDDname"
    name = "dev"
    environment ="dev"

}


// Définition du second module "instancebdd2" utilisant le code situé dans le dossier "./modules" avec des paramètres différents
module "instancebdd2" {
    source = "./modules"

    
    db_username = "otheruser"
    db_name = "BDDothername"
    name = "dev2"
    environment ="uat"

}

// Générer un mot de passe aléatoire avec une longueur de 16 caractères
resource "random_password" "db_password" {
  length  = 16
  special = true
}


// Créer un secret dans Secrets Manager pour stocker le mot de passe de la base de données
resource "aws_secretsmanager_secret" "db_secret" {
  name        = "${var.name}-db-secret"
  description = "Stocke le mot de passe MySQL pour ${var.name}"
}

// Mettre à jour  la version du secret avec le contenu JSON contenant le nom d'utilisateur et le mot de passe
resource "aws_secretsmanager_secret_version" "db_secret_value" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = var.db_username
    password = random_password.db_password.result
  })
}

// Créer une instance de base de données MySQL sur RDS
resource "aws_db_instance" "mysql" {
  identifier              = "${var.name}-mysql"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = var.instance_type
  username                = var.db_username
  password                = random_password.db_password.result
  db_name                 = var.db_name
  skip_final_snapshot     = true
  publicly_accessible     = false

  tags = {
    Name = var.name
    Environment = var.environment
  }
}

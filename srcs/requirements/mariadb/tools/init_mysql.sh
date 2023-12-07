#!/bin/bash

# Attendre que le service MySQL démarre
until mysqladmin ping &>/dev/null; do
  echo "Attente du démarrage du service MySQL..."
  sleep 1
done

# Exécuter les commandes SQL
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -u root -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -u root -e "FLUSH PRIVILEGES"

# Arrêter le service MySQL
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

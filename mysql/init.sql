-- Créer la base de données si elle n'existe pas
CREATE DATABASE IF NOT EXISTS user_management_db;

-- Utiliser la base de données
USE user_management_db;

-- Table roles (sera créée par JPA, mais voici la structure)
CREATE TABLE IF NOT EXISTS roles (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    description VARCHAR(255)
);

-- Insérer les rôles par défaut
INSERT IGNORE INTO roles (name, description) VALUES
    ('ROLE_USER', 'Utilisateur standard'),
    ('ROLE_ADMIN', 'Administrateur');


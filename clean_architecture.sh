#!/bin/bash

# Demander à l'utilisateur de saisir le nom de la fonctionnalité
#read -p "Entrez le nom de la fonctionnalité (ex: auth): " feature_name

# Config
mkdir -p lib/config/routes
mkdir -p lib/config/theme
mkdir -p lib/config/assets
mkdir -p lib/config/constants
touch lib/config/routes/navigation_service.dart
touch lib/config/theme/theme.dart
touch lib/config/assets/assets.dart
touch lib/config/constants/constants.dart

# Core
mkdir -p lib/core/error
mkdir -p lib/core/network
mkdir -p lib/core/usecases
mkdir -p lib/core/util

# Feature (dépendant de l'entrée utilisateur)
# mkdir -p lib/features/$feature_name/data/data_sources
# mkdir -p lib/features/$feature_name/data/models
# mkdir -p lib/features/$feature_name/data/repository

# mkdir -p lib/features/$feature_name/domain/entities
# mkdir -p lib/features/$feature_name/domain/repository
# mkdir -p lib/features/$feature_name/domain/usecases

# mkdir -p lib/features/$feature_name/presentation/bloc
# mkdir -p lib/features/$feature_name/presentation/pages
# mkdir -p lib/features/$feature_name/presentation/widgets

# echo "Architecture de dossiers créée avec succès pour la fonctionnalité '$feature_name'."
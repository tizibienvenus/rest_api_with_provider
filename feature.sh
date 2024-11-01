#!/bin/bash

# Demander à l'utilisateur de saisir le nom de la fonctionnalité
read -p "Entrez le nom de la fonctionnalité (ex: auth): " feature_name

# Demander à l'utilisateur de choisir l'état de gestion
read -p "provider (1), riverpod (2), bloc (3), autre (4 ou ignorer): " state

# Création des dossiers et fichiers de la fonctionnalité
mkdir -p lib/features/$feature_name/data/data_sources
touch  lib/features/$feature_name/data/data_sources/${feature_name}_datasources.dart

mkdir -p lib/features/$feature_name/data/models
#touch lib/features/$feature_name/data/models/${feature_name}_

mkdir -p lib/features/$feature_name/data/repository/${feature_name}_repo.dart

mkdir -p lib/features/$feature_name/domain/entities
mkdir -p lib/features/$feature_name/domain/repository
mkdir -p lib/features/$feature_name/domain/repository/${feature_name}_repository.dart

mkdir -p lib/features/$feature_name/domain/usecases/${feature_name}_usecases.dart

mkdir -p lib/features/$feature_name/presentation/state

mkdir -p lib/features/$feature_name/presentation/pages
touch lib/features/$feature_name/presentation/pages/${feature_name}_screen.dart

mkdir -p lib/features/$feature_name/presentation/widgets
touch lib/features/$feature_name/presentation/widgets/${feature_name}_widgets.dart

# Condition selon l'état choisi
if [[ $state -eq 1 ]]; then
    echo "Utilisation de Provider pour la gestion d'état."
    mkdir -p lib/features/$feature_name/presentation/provider
    touch lib/features/$feature_name/presentation/provider/${feature_name}_provider.dart
elif [[ $state -eq 2 ]]; then
    echo "Utilisation de Riverpod pour la gestion d'état."
    mkdir -p lib/features/$feature_name/presentation/riverpod
    touch lib/features/$feature_name/presentation/riverpod/${feature_name}_riverpod.dart
elif [[ $state -eq 3 ]]; then
    echo "Utilisation de BLoC pour la gestion d'état."
     mkdir -p lib/features/$feature_name/presentation/bloc
    touch lib/features/$feature_name/presentation/bloc/${feature_name}_bloc.dart
    touch lib/features/$feature_name/presentation/bloc/${feature_name}_event.dart
    touch lib/features/$feature_name/presentation/bloc/${feature_name}_state.dart
elif [[ $state -eq 4 ]]; then
    read -p "Entrez le nom de votre solution personnalisée: " custom_state
    touch lib/features/$feature_name/presentation/$state/${feature_name}_$custom_state.dart
    echo "Utilisation de la solution personnalisée: $custom_state."
else
    echo "Aucune solution de gestion d'état sélectionnée."
fi

echo "Architecture de dossiers créée avec succès pour la fonctionnalité '$feature_name'."

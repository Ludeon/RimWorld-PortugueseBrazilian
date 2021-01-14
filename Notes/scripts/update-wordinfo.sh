#!/usr/bin/env bash

########################################
# Fonctions
########################################
# Elles permettent surtout de rendre le script plus lisible

# Supprime BOM, commentaires et lignes vides du flux
clean() { sed -e 's/\xEF\xBB\xBF/\n/' | grep -av '^//' | grep -avE '^[[:space:]]*$' ; }

# Supprime du flux les lignes présentes dans le fichier passé en 1er argument
exclude() { grep -avxFf "$1" ; }

# Ne conserve du flux que les lignes présentes dans le fichier passé en 1er argument
intersect() { grep -axFf "$1" ; }

# Supprime les doublons du flux
unique() { sort --unique ; }

# Extrait du flux le contenu des tags utilisés par le système de traduction
extract_tag_content() {
  grep -aE '\.(label|labelMale|labelMalePlural|labelFemale|labelFemalePlural|pawnSingular|pawnsPlural|customLabel)>' \
  | sed 's/^.*>\([^<]*\)<.*$/\1/' ;
}

extract_tag_male_content() { grep -aE '\.(labelMale|labelMalePlural)>' | sed 's/^.*>\([^<]*\)<.*$/\1/' ; }
extract_tag_female_content() { grep -aE '\.(labelFemale|labelFemalePlural)>' | sed 's/^.*>\([^<]*\)<.*$/\1/' ; }
extract_tag_plural_content() { grep -aE '\.(labelMalePlural|labelFemalePlural|pawnsPlural)>' | sed 's/^.*>\([^<]*\)<.*$/\1/' ; }

# HediffDef : Currently, labelNoun are defined as
#   <...labelNoun>un xxx</...labelNoun> or <...labelNoun>une yyy</...labelNoun>
extract_tag_noun_content() { grep -aE '\.(labelNoun)>[uU]n' | sed 's/^[^>]*>[uU]ne* \([^<]*\)<.*$/\1/' ; }
extract_tag_noun_male_content() { grep -aE '\.(labelNoun)>[uU]n ' | sed 's/^[^>]*>[uU]n \([^<]*\)<.*$/\1/' ; }
extract_tag_noun_female_content() { grep -aE '\.(labelNoun)>[uU]ne ' | sed 's/^[^>]*>[uU]ne \([^<]*\)<.*$/\1/' ; }
extract_tag_noun_plural_content() { grep -aE '\.(labelNoun)>[dD]es ' | sed 's/^[^>]*>[dD]es \([^<]*\)<.*$/\1/' ; }
extract_tag_tools_content() { grep -aE '\.tools[^>]*\.(label)>' | sed 's/^[^>]*>\([^<]*\)<.*$/\1/' ; }

# Passe tout en minuscule
to_lowercase() { PERLIO=:utf8 perl -ne 'print lc $_' ;  }

########################################
# Début du script
########################################
set -ex

# Va à la racine du projet
cd $(dirname $(readlink -f $0))/../..

# Créer un répertoire de travail et s'assure qu'il soit supprimé à la fin
WORKDIR=$(mktemp -d)
trap "rm -rf $WORKDIR" EXIT

# Force la langue pour les outils qui en tiennent compte
export LANG=fr_FR.UTF-8 LC_ALL=fr_FR.UTF-8

# Liste des tags provenant du XML
cat */DefInjected/{PawnKind,Faction,SitePart,Thing,WorldObject,GameCondition}Def/*.xml | extract_tag_content | to_lowercase | unique > $WORKDIR/all
cat */DefInjected/{Body,BodyPart}Def/*.xml | extract_tag_content | to_lowercase | unique >> $WORKDIR/all
cat */DefInjected/HediffDef/*.xml | extract_tag_noun_content | to_lowercase | unique >> $WORKDIR/all
cat */DefInjected/HediffDef/*.xml | extract_tag_noun_plural_content | to_lowercase | unique >> $WORKDIR/all
cat */DefInjected/HediffDef/*.xml | extract_tag_tools_content | to_lowercase | unique >> $WORKDIR/all

# Ajouter labelMale* dans WordInfo/Gender/Male.txt
cat */WordInfo/Gender/Male.txt > $WORKDIR/all_males.txt
cat */DefInjected/{PawnKind,Faction,Thing,WorldObject}Def/*.xml | extract_tag_male_content >> $WORKDIR/all_males.txt
cat */DefInjected/HediffDef/*.xml | extract_tag_noun_male_content >> $WORKDIR/all_males.txt
cat $WORKDIR/all_males.txt | to_lowercase | unique > Core/WordInfo/Gender/Male.txt

# Ajouter labelFemale* dans WordInfo/Gender/Female.txt
cat */WordInfo/Gender/Female.txt > $WORKDIR/all_females.txt
cat */DefInjected/{PawnKind,Faction,Thing,WorldObject}Def/*.xml | extract_tag_female_content >> $WORKDIR/all_females.txt
cat */DefInjected/HediffDef/*.xml | extract_tag_noun_female_content >> $WORKDIR/all_females.txt
cat $WORKDIR/all_females.txt | to_lowercase | unique > Core/WordInfo/Gender/Female.txt

# Ajouter label*Plural dans WordInfo/Gender/Plural.txt
cat */WordInfo/Gender/Plural.txt > $WORKDIR/all_plurals.txt
cat */DefInjected/{PawnKind,Faction,Thing,WorldObject}Def/*.xml | extract_tag_plural_content >> $WORKDIR/all_plurals.txt
cat */DefInjected/HediffDef/*.xml | extract_tag_noun_plural_content | to_lowercase | unique >> $WORKDIR/all_plurals.txt
cat $WORKDIR/all_plurals.txt | to_lowercase | unique > Core/WordInfo/Gender/Plural.txt

# Liste des mots déjà classés par genre
cat Core/WordInfo/Gender/{Male,Female}.txt | unique > $WORKDIR/wordinfo

# Ajouter les mots au singulier dans WordInfo/Gender/Singular.txt
# (pour le test de Pluralize)
exclude Core/WordInfo/Gender/Plural.txt < $WORKDIR/all | unique > Core/WordInfo/Gender/Singular.txt

# Ajoute les nouveaux mots dans WordInfo/Gender/new_words.txt
exclude $WORKDIR/wordinfo < $WORKDIR/all | unique > Core/WordInfo/Gender/new_words.txt

# Supprime les mots obsolètes des fichiers WordInfo/Gender/{Male,Female}.txt
for GENDER in Male Female; do
  intersect $WORKDIR/all < Core/WordInfo/Gender/$GENDER.txt > $WORKDIR/$GENDER.txt
  mv $WORKDIR/$GENDER.txt Core/WordInfo/Gender/$GENDER.txt
done

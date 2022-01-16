#!/usr/bin/env bash

# .FUNÇÕES
# Remove estrutura de produtos, comentários e linhas vazias do feed.
clean() { sed -e 's/\xEF\xBB\xBF/\n/' | grep -av '^//' | grep -avE '^[[:space:]]*$' ; }

# Remove do fluxo as linhas encontradas no arquivo passado como 1º argumento.
exclude() { grep -avxFf "$1" ; }

# Mantém no fluxo apenas as linhas encontradas no arquivo passado como 1º argumento.
intersect() { grep -axFf "$1" ; }

# Remove as linhas duplicadas do feed.
unique() { sort --unique ; }

# Extrai do feed o conteúdo das etiquetas usadas pelo sistema de tradução.
extract_tag_content() {
  grep -aE '\.(label|labelMale|labelMalePlural|labelFemale|labelFemalePlural|pawnSingular|pawnsPlural|customLabel)>' \
  | sed 's/^.*>\([^<]*\)<.*$/\1/' ;
}

extract_tag_male_content() { grep -aE '\.(labelMale|labelMalePlural)>' | sed 's/^.*>\([^<]*\)<.*$/\1/' ; }
extract_tag_female_content() { grep -aE '\.(labelFemale|labelFemalePlural)>' | sed 's/^.*>\([^<]*\)<.*$/\1/' ; }
extract_tag_plural_content() { grep -aE '\.(labelMalePlural|labelFemalePlural|pawnsPlural)>' | sed 's/^.*>\([^<]*\)<.*$/\1/' ; }
extract_tag_noun_content() { grep -aE '\.(labelNoun)>[uU]n' | sed 's/^[^>]*>[uU]ne* \([^<]*\)<.*$/\1/' ; }
extract_tag_noun_male_content() { grep -aE '\.(labelNoun)>[uU]n ' | sed 's/^[^>]*>[uU]n \([^<]*\)<.*$/\1/' ; }
extract_tag_noun_female_content() { grep -aE '\.(labelNoun)>[uU]ne ' | sed 's/^[^>]*>[uU]ne \([^<]*\)<.*$/\1/' ; }
extract_tag_noun_plural_content() { grep -aE '\.(labelNoun)>[dD]es ' | sed 's/^[^>]*>[dD]es \([^<]*\)<.*$/\1/' ; }
extract_tag_tools_content() { grep -aE '\.tools[^>]*\.(label)>' | sed 's/^[^>]*>\([^<]*\)<.*$/\1/' ; }

# Converte tudo em minúsculo.
to_lowercase() { PERLIO=:utf8 perl -ne 'print lc $_' ;  }


# .SCRIPT
set -ex

# Destina-se à raiz do projeto.
cd $(dirname $(readlink -f $0))/../..

# Cria um diretório e certifica-se de que ele seja excluído no final.
WORKDIR=$(mktemp -d)
trap "rm -rf $WORKDIR" EXIT

# Força a linguagem para ferramentas que a levam em consideração.
export LANG=fr_FR.UTF-8 LC_ALL=fr_FR.UTF-8

# Lista as etiquetas do XML.
cat */DefInjected/{PawnKind,Faction,SitePart,Thing,WorldObject,GameCondition}Def/*.xml | extract_tag_content | to_lowercase | unique > $WORKDIR/all
cat */DefInjected/{Body,BodyPart}Def/*.xml | extract_tag_content | to_lowercase | unique >> $WORKDIR/all
cat */DefInjected/HediffDef/*.xml | extract_tag_noun_content | to_lowercase | unique >> $WORKDIR/all
cat */DefInjected/HediffDef/*.xml | extract_tag_noun_plural_content | to_lowercase | unique >> $WORKDIR/all
cat */DefInjected/HediffDef/*.xml | extract_tag_tools_content | to_lowercase | unique >> $WORKDIR/all

# Adiciona 'labelMale*' em 'WordInfo/Gender/Male.txt'.
cat */WordInfo/Gender/Male.txt > $WORKDIR/all_males.txt
cat */DefInjected/{PawnKind,Faction,Thing,WorldObject}Def/*.xml | extract_tag_male_content >> $WORKDIR/all_males.txt
cat */DefInjected/HediffDef/*.xml | extract_tag_noun_male_content >> $WORKDIR/all_males.txt
cat $WORKDIR/all_males.txt | to_lowercase | unique > Core/WordInfo/Gender/Male.txt

# Adiciona 'labelFemale*' em 'WordInfo/Gender/Female.txt'.
cat */WordInfo/Gender/Female.txt > $WORKDIR/all_females.txt
cat */DefInjected/{PawnKind,Faction,Thing,WorldObject}Def/*.xml | extract_tag_female_content >> $WORKDIR/all_females.txt
cat */DefInjected/HediffDef/*.xml | extract_tag_noun_female_content >> $WORKDIR/all_females.txt
cat $WORKDIR/all_females.txt | to_lowercase | unique > Core/WordInfo/Gender/Female.txt

# Adiciona 'label*Plural' em 'WordInfo/Gender/Plural.txt'.
cat */WordInfo/Gender/Plural.txt > $WORKDIR/all_plurals.txt
cat */DefInjected/{PawnKind,Faction,Thing,WorldObject}Def/*.xml | extract_tag_plural_content >> $WORKDIR/all_plurals.txt
cat */DefInjected/HediffDef/*.xml | extract_tag_noun_plural_content | to_lowercase | unique >> $WORKDIR/all_plurals.txt
cat $WORKDIR/all_plurals.txt | to_lowercase | unique > Core/WordInfo/Gender/Plural.txt

# Lista as palavras classificadas por gênero.
cat Core/WordInfo/Gender/{Male,Female}.txt | unique > $WORKDIR/wordinfo

# Adiciona palavras no singular em 'WordInfo/Gender/Singular.txt'.
exclude Core/WordInfo/Gender/Plural.txt < $WORKDIR/all | unique > Core/WordInfo/Gender/Singular.txt

# Adiciona novas palavras em 'WordInfo/Gender/new_words.txt'.
exclude $WORKDIR/wordinfo < $WORKDIR/all | unique > Core/WordInfo/Gender/new_words.txt

# Remove palavras obsoletas dos arquivos 'WordInfo/Gender/{Male,Female}.txt'.
for GENDER in Male Female; do
  intersect $WORKDIR/all < Core/WordInfo/Gender/$GENDER.txt > $WORKDIR/$GENDER.txt
  mv $WORKDIR/$GENDER.txt Core/WordInfo/Gender/$GENDER.txt
done
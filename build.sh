#!/bin/bash

# Crée le dossier output
echo "Création du dossier output"
if [ ! -d "output" ]; then
  mkdir output
fi

# Supprime hangman si il existe
if [ -f "output/hangman" ]; then
  rm output/hangman
fi

# Supprime le dossier ASCII_arts s'il existe
if [ -d "output/ASCII_arts" ]; then
  rm -rf output/ASCII_arts
fi

# Compile le programme
echo "Compilation du programme"
cd src
go build -o ../output/hangman

# Ajoute le dossier ASCII_arts dans le dossier output
echo "Copie des ASCII arts"
cp -r ASCII_arts ../output

# Copie tous les fichiers .txt ne contenant pas le mot leaderboard dans le dossier output
echo "Copie des listes de mots"
find . -maxdepth 1 -type f -name "*.txt" ! -name "*leaderboard*" -exec cp {} ../output/ \;

cd ..
echo "Compilation terminée"

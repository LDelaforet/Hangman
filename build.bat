@echo off

REM Crée le dossier output
echo Création du dossier output
if not exist output mkdir output

REM Supprime hangman.exe si il existe
if exist output\hangman.exe del output\hangman.exe
if exist output\ASCII_arts rmdir /s /q output\ASCII_arts

REM Crée le dossier ASCII_arts
echo Création du dossier ASCII_arts
mkdir output\ASCII_arts

cd src

REM Compile le programme
echo Compilation du programme
go build -o ..\output\hangman.exe

REM Ajoute le dossier ASCII_arts dans le dossier output
echo Copie des ASCII arts

xcopy /s ASCII_arts ..\output\ASCII_arts > nul

REM Copie tous les fichiers .txt ne contenant pas le mot leaderboard dans le dossier output
echo Copie des listes de mots
xcopy /s *.txt ..\output > nul

cd ..

echo Compilation terminée
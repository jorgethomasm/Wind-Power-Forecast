#!/usr/bin/env bash

rm ./Wind-Power-Forecast.html
quarto render ./Wind-Power-Forecast.qmd --to html

rm -rf docs/
mkdir docs
cp ./Wind-Power-Forecast.html ./docs/

p=$(pwd)
git config --global --add safe.directory $p

if [[ "$(git status --porcelain)" != "" ]]; then
    # quarto render ./docs/index.qmd
    git config --global user.name $USER_NAME
    git config --global user.email $USER_EMAIL    
    git add data/*
    git add docs/*
    git commit -m "Forecast updated"
    git push origin main
else
echo "Nothing to commit..."
fi
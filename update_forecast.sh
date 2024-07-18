#!/usr/bin/env bash

# rm -rf docs/
# mkdir docs

quarto render ./Wind-Power-Forecast.qmd --to html

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
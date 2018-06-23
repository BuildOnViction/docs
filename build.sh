#!/bin/bash
set -e
mkdocs build --clean
git clone --branch gh-pages https://${GH_TOKEN}@github.com/tomochain/docs.git gh-pages
rsync -av site/ gh-pages/
cd gh-pages
git config user.name "Travis CI"
git config user.email "noreply@tomochain.com"
git add .
git commit -m "Deploy from Travis CI"
git push

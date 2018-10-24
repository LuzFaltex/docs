#!/bin/sh
set -e

docfx ./docs/docfx.json

SOURCE_DIR=$PWD
TEMP_REPO_DIR=$PWD/../my-project-gh-pages

echo "Removing temporary doc directory $TEMP_REPO_DIR"
rm -rf $TEMP_REPO_DIR
mkdir $TEMP_REPO_DIR

echo "Cloning the repo with the gh-pages branch"
git clone https://github.com/LuzFaltex/docs.git --branch gh-pages $TEMP_REPO_DIR

echo "Clear repo directory"
cd $TEMP_REPO_DIR
git rm -r *

echo "Copy documentation into the repo"
cp -r $SOURCE_DIR/docs/_site/* .

echo "Build CNAME doc"
echo -e "docs.luzfaltex.com\n" >> CNAME

echo "Push the new docs to the remote branch"
git add . -A
git commit -m "Update generated documentation"
git push -f origin gh-pages
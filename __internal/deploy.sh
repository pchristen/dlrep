#!/bin/bash

# Ozgur: Heavily based on the following.
# http://github.com/steveklabnik/automatically_update_github_pages_with_travis_example

set -o errexit
set -o nounset

if [ $TRAVIS_PULL_REQUEST != "false" ]; then
    echo "This is pull request number $TRAVIS_PULL_REQUEST."
    echo "The build will be deployed to to the 'previews' repository."
    rev=$(git rev-parse --short HEAD)
    rm -rf repo-upstream
    git clone "https://github.com/dlrep/previews.git" repo-upstream
    cd repo-upstream
    git checkout -B gh-pages
    rm -rf $TRAVIS_PULL_REQUEST
    cp -r ../_site $TRAVIS_PULL_REQUEST
    git config user.name "DLRep Build Bot"
    git config user.email "ozgurakgun@gmail.com"
    git add --all
    git commit -m "Preview build for PR dlrep/dlrep#$TRAVIS_PULL_REQUEST, commit dlrep/dlrep@$rev"
    git remote add upstream "https://$GH_TOKEN@github.com/dlrep/production.git"
    git push upstream gh-pages

elif [ $TRAVIS_BRANCH == "master" ]; then
    echo "This is the master branch."
    echo "The build will be deployed to to the 'production' repository."
    rev=$(git rev-parse --short HEAD)
    rm -rf repo-upstream
    git clone "https://github.com/dlrep/production.git" repo-upstream
    cd repo-upstream
    git checkout -B gh-pages
    rm -rf *
    cp -r ../_site/* .
    git config user.name "DLRep Build Bot"
    git config user.email "ozgurakgun@gmail.com"
    git add --all
    git commit -m "Deploying commit dlrep/dlrep@$rev"
    git remote add upstream "https://$GH_TOKEN@github.com/dlrep/production.git"
    git push upstream gh-pages

else
    echo "Skipping deploy."

fi

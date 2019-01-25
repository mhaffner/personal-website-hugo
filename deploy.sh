#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Copy CV from GitHub
wget -O static/files/cv.pdf 'https://github.com/mhaffner/Awesome-CV/raw/master/cv.pdf'

# Build the project.
R -e "setwd('/home/matt/git-repos/personal-website-hugo'); blogdown::build_site()"

# Go To Public folder
cd public
# Add changes to git.
git add -A

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..

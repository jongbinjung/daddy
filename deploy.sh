#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

git log --pretty=format:"%s" --since="$(cat last_deploy)" > dam.jongbin.com/upstream_commits
date +"%F %T" > last_deploy

# Build the project.
hugo -d dam.jongbin.com

# Go To Public folder
cd dam.jongbin.com
# Add changes to git.
git add -A

# Commit changes.
msg="Rebuild site `date +'%F %T'`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg" -m "$(cat upstream_commits)"

# Push source and build repos.
git push origin gh-pages

# Come Back
cd ..


# Older rsync-based one-liner
# rsync -rlpdoDz --force --delete --progress -e "ssh -p22" public/ jongbin@jongbin.com:/home/jongbin/www/blog

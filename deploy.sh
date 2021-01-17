#!/bin/bash
echo -e "\033[0;32mPushing updates to personal-website...\033[0m"
#
git fetch upstream
git add .
git commit -m 'update personal-website'
git rebase upstream/master
git push origin master

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`
# Go To Public folder
cd public
# Add changes to git.
git add .
# Commit changes.
msg="rebuilding site $(date)"
if [ -n "$*" ]; then
	msg="$*"
fi
git commit -m "$msg"
# Push source and build repos.
git push origin master
# Come Back up to the Project Root
cd ..
echo -e "\033[0;32mFinished, enjoy your website!!!\033[0m"

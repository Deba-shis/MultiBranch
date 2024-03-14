#!/bin/bash

# Set the file to reflect
FILE_PATH="Jenkinsfile"

# Fetch the latest changes from the remote repository
git fetch origin

# Get the list of local branches
BRANCHES=$(git branch --format='%(refname:short)')

# Loop through each branch (excluding master)
for BRANCH in $BRANCHES; do
    if [ "$BRANCH" != "main" ]; then
        # Checkout to the branch
        git checkout $BRANCH

        # Cherry-pick the changes from the main branch
        git cherry-pick main -- $FILE_PATH

        # Resolve conflicts if any
        # Commit the changes
        git commit -am "Reflect changes from main branch"

        # Push the changes to the remote repository
        git push origin $BRANCH
    fi
done


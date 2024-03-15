#!/bin/bash

# Set the file to reflect
FILE_PATH="Jenkinsfile"

# Fetch the latest changes from the remote repository
git fetch origin

# Get the list of local branches
BRANCHES=$(git branch --format='%(refname:short)')

# Checkout the main branch
git checkout main

# Copy Jenkinsfile to a temporary location
cp "$FILE_PATH" /tmp/Jenkinsfile_tmp

# Loop through each branch (excluding main)
for BRANCH in $BRANCHES; do
    if [ "$BRANCH" != "main" ]; then
        # Checkout to the branch
        git checkout $BRANCH

        # Remove the existing Jenkinsfile if it exists
        if [ -f "$FILE_PATH" ]; then
            git rm "$FILE_PATH"
        fi

        # Copy Jenkinsfile from the temporary location
        cp /tmp/Jenkinsfile_tmp "$FILE_PATH"

        # Add the new Jenkinsfile
        git add "$FILE_PATH"

        # Commit the changes
        git commit -m "Reflect changes from main branch"

        # Push the changes to the remote repository
        git push origin $BRANCH
    fi
done

# Switch back to the main branch
git checkout main


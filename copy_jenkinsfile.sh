#!/bin/bash

# Set the branch with the Jenkinsfile
SOURCE_BRANCH="main"
# Set the target branches where you want to reflect the Jenkinsfile
TARGET_BRANCHES=("feature/v2" "feature1/v1" "feature/v3" "feature1/v2")

# Loop through each target branch
for TARGET_BRANCH in "${TARGET_BRANCHES[@]}"; do
    # Checkout the target branch
    git checkout $TARGET_BRANCH

    # Copy the Jenkinsfile from the source branch
    git checkout $SOURCE_BRANCH -- Jenkinsfile

    # Commit the changes
    git add Jenkinsfile
    git commit -m "Copy Jenkinsfile from $SOURCE_BRANCH to $TARGET_BRANCH"

    # Push the changes to the remote repository
    git push origin $TARGET_BRANCH

    # Checkout back to the source branch
    git checkout $SOURCE_BRANCH
done

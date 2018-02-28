#!/usr/bin/env bash

echo "Deleter will find and delete all your Github Repos"
echo "It will pause 1 second in between deletions to give you time to reconsider!"

if [ -z "${GITHUB_PRIVATE_AUTH_TOKEN+xxx}" ];
then
 echo "GITHUB_PRIVATE_AUTH_TOKEN not defined"
 exit 1
fi
if [ -z "${GITHUB_PRIVATE_ORG+xxx}" ];
then
 echo "GITHUB_PRIVATE_ORG not defined"
 exit 1
fi



echo "It will start in 5 seconds (CTRL-C to cancel)..."
sleep 5

# Get a list of all the remote repos (using the AUTH_TOKEN for Github)
ALL_REPOS=$(curl -H "Authorization: token $GITHUB_PRIVATE_AUTH_TOKEN" https://api.github.com/orgs/$GITHUB_PRIVATE_ORG/repos?per_page=100)
REPO_NAMES_STRING=$(echo $ALL_REPOS | jq '.[] | .name' | sed 's/"//g')
REPO_HTTPS_STRING=$(echo $ALL_REPOS | jq '.[] | .clone_url'| sed 's/"//g')

set -f # avoid globbing / expansion of *
REPO_NAMES=(${REPO_NAMES_STRING// / })
REPO_HTTPS=(${REPO_HTTPS_STRING// / })

# For each of the repos - grab the name, the code and create the enterprise version
for i in "${!REPO_NAMES[@]}"
do
    echo "Preparing to remove ${REPO_HTTPS[i]}..."
    sleep 1

    echo "Deleting ${REPO_NAMES[i]}"
    curl -q -X DELETE -H "Authorization: token $GITHUB_PRIVATE_AUTH_TOKEN" "https://api.github.com/repos/$GITHUB_PRIVATE_ORG/${REPO_NAMES[i]}"
done

exit 0

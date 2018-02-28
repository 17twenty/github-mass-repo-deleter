# Github Mass Repo Deleter

Simple script that relies on having [personal access tokens](https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/)
for your repo/org with delete rights.

## Getting Started

Really simple. Grab the script. Set the params. Run the script. Cleanup anything
that didn't push.

```bash
$ export GITHUB_PRIVATE_AUTH_TOKEN=XXXXXX
$ export GITHUB_PRIVATE_ORG=companyName
$  bash deleter.sh

Deleter will find and delete all your Github Repos
It will pause 1 second in between deletions to give you time to reconsider!

It will start in 5 seconds (CTRL-C to cancel)...

Preparing to remove https://github.com/XXX/teamcity.git...
Deleting teamcity
Preparing to remove https://github.com/XXX/ecs-cluster.git...
Deleting ecs-cluster
Preparing to remove https://github.com/XXX/infrastructure.ghe.git...
Deleting infrastructure.ghe
...
```

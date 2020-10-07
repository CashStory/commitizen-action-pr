#!/bin/bash

INPUT_BRANCH=${INPUT_BRANCH:-master}
REPOSITORY=${INPUT_REPOSITORY:-$GITHUB_REPOSITORY}

set -e

echo "Repository: $REPOSITORY"
echo "Actor: $GITHUB_ACTOR"

echo "Installing requirements..."
if [[ -f "requirements.txt" ]]; then
    # Ensure commitizen + reqs may have custom commitizen plugins
    pip install -r requirements.txt commitizen
else
    pip install commitizen
fi

PULL_TITLE=echo $GITHUB_EVENT_PATH | python3 -c "import sys, json; print(json.load(sys.stdin)['pull_request']['title'])"
echo "Running cz check: "
echo $PULL_TITLE | cz check

echo "Done."

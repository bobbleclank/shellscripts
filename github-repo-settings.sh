#!/bin/bash

set -e

command -v gh >/dev/null || {
  echo "gh CLI not found. Install from https://cli.github.com" >&2
  exit 1
}

gh auth status >/dev/null 2>&1 || {
  echo "Not logged in to GitHub. Run: gh auth login" >&2
  exit 1
}

repo=$(gh repo view --json nameWithOwner -q .nameWithOwner 2>/dev/null) || {
  echo "Could not determine the repo. Run this from inside a GitHub repo clone." >&2
  exit 1
}

echo "Apply baseline settings to GitHub repo: $repo"
read -r -p "Continue? [y/N] " reply
[[ "$reply" == "y" || "$reply" == "Y" ]] || {
  echo "Aborted."
  exit 1
}

gh api --method PATCH "repos/$repo" \
  -F has_wiki=false \
  -F has_issues=true \
  -F has_projects=false \
  -F has_pull_requests=false \
  -f pull_request_creation_policy=collaborators_only \
  -F allow_merge_commit=false \
  -F allow_squash_merge=true \
  -f squash_merge_commit_title=PR_TITLE \
  -f squash_merge_commit_message=BLANK \
  -F allow_rebase_merge=false \
  -F allow_update_branch=false \
  -F allow_auto_merge=false \
  -F delete_branch_on_merge=true \
  -F web_commit_signoff_required=false \
  >/dev/null

echo "Settings applied via the GitHub API."
echo
cat <<'EOF'
Manual steps (not settable via API — do these in the repo settings UI):
  - Allow comments on individual commits: turn OFF (Settings > General)

Verify (all should already be at these defaults):
  - Issue permissions, Creation allowed by: All users
  - Sponsorships OFF
  - Preserve this repository ON
  - Discussions OFF
  - Include Git LFS objects in archives OFF
  - Limit how many branches and tags can be updated in a single push OFF
  - Auto-close issues with merged linked pull requests ON
EOF

# gx()
# Convenience function to return to and update the default Git branch after finishing on a feature
# branch
gx() {
  current_branch=$(git symbolic-ref --short HEAD)
  default_branch=$(git remote show origin | grep 'HEAD branch' | cut -d' ' -f5)

  if [[ $current_branch == $default_branch ]]; then
    echo "Already on default branch '$default_branch'."
    return 1
  fi

  # Check for uncommitted changes
  if ! git diff-index --quiet HEAD --; then
    echo "Uncommitted changes present. Cannot delete branch."
    return 1
  fi

  # Fetch remote default branch
  git fetch origin $default_branch

  # Check if local feature branch is fully merged into remote default branch
  if [[ $(git log origin/$default_branch..$current_branch) ]]; then
    echo "Local branch '$current_branch' has commits not in remote default branch '$default_branch'. Cannot delete."
    return 1
  fi

  git checkout $default_branch && git branch -D "$current_branch" && git pull origin $default_branch
}

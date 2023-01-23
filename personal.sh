# I always set user.name globally, but force user.email to be set locally for each repo.
# This makes it easy to deal with multiple repos of personal vs. corp nature simultaneously.
# git commit without user.email set is prevented via `git config --global user.useConfigOnly true`
git config --global user.name "Alex N. Jose"

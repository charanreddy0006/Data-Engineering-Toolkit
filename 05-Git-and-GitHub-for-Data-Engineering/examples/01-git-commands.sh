# `examples/01-git-commands.sh`

```bash
#!/bin/bash

echo "Git Version"
git --version

echo
echo "Current Repository Status"
git status

echo
echo "Recent Commits"
git log --oneline -5

echo
echo "Current Branch"
git branch --show-current
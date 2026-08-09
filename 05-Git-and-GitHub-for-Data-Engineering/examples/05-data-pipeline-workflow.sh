#!/bin/bash

echo "Data Engineering Git Workflow"
echo "=============================="

echo
echo "1. Check repository:"
git status

echo
echo "2. Create feature branch:"
echo "git switch -c feature/vehicle-pipeline"

echo
echo "3. Develop and test pipeline"

echo
echo "4. Review changes:"
echo "git diff"

echo
echo "5. Stage changes:"
echo "git add ."

echo
echo "6. Review staged changes:"
echo "git diff --staged"

echo
echo "7. Commit:"
echo 'git commit -m "Add vehicle data pipeline"'

echo
echo "8. Push feature:"
echo "git push -u origin feature/vehicle-pipeline"

echo
echo "9. Open Pull Request on GitHub"

echo
echo "Workflow completed."
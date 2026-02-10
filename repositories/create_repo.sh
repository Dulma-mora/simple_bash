#!/bin/bash


# create_repo.sh
# Turns an existing folder into a GitHub-tracked repo

# Usage: ./create_git_repo.sh <existing_path> <remote_url>
# Example: ./create_repo.sh /group/bienko/projects/HiC-SV/hic/scripts https://github.com/Dulma-mora/HiC-SV_Project.git
# bash create_repo.sh /group/bienko/user_folders/dulce.montero/Tests/simple_bash https://github.com/Dulma-mora/simple_bash.git
# bash create_repo.sh /group/bienko/projects/HiC-SV/hic/notebooks/MV_003 https://github.com/Dulma-mora/MV_003_notebooks.git
set -e  

REPO_PATH=$1
REMOTE_URL=$2

if [[ -z "$REPO_PATH" || -z "$REMOTE_URL" ]]; then
    echo "Usage: $0 <existing_path> <remote_url>"
    exit 1
fi

cd "$REPO_PATH"


git init

# mark it as safe directory on a shared file system!
git config --global --add safe.directory "$REPO_PATH"

# Create .gitignore 
cat > .gitignore <<EOF
*.log
*.bed
*.tsv
*.csv
*.pdf
*.png
*.jpeg
*.jpg
*.zip
*.gz
.ipynb_checkpoints/
.DS_Store
EOF

# Stage and commit tracked files only (scripts, etc.)
git add .
git commit -m "Initial commit: add scripts and setup .gitignore"

git branch -M main

git remote add origin "$REMOTE_URL"


# Merge remote if it has README/LICENSE created on GitHub
git pull origin main --allow-unrelated-histories --no-rebase || true
git push -u origin main


echo "The existing project '$REPO_PATH' is now tracked by GitHub! ✅"




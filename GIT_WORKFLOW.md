# Local Git Exercise

This repository is the local repository for Developer One. The identity is repository-local, so it does not change your global Git settings.

## 1. Initialize and identify the repository

```powershell
git init
git config user.name "Developer One"
git config user.email "developer1@example.com"
git status --short
```

A new file appears as `??` (untracked). A modified tracked file appears as ` M` before staging. The first column indicates staged changes.

## 2. Add and commit an untracked file

```powershell
git add GIT_WORKFLOW.md
git status --short
git diff --cached -- GIT_WORKFLOW.md
git commit -m "Add local Git workflow guide"
```

`git add` starts tracking the file and stages its contents. `git commit` saves the staged snapshot in the local repository.

## 3. Modify, inspect, stage, and commit a tracked file

Make a small edit to `README.md`, then inspect it before staging:

```powershell
git status --short
git diff -- README.md
git add README.md
git status --short
git diff --cached -- README.md
git commit -m "Document the Git workflow"
```

The first `git diff` shows unstaged changes. After `git add`, `git diff --cached` shows what the next commit will contain.

## 4. Review commit history

```powershell
git log --all --pretty=format:"%h | %an | <%ae> | %s"
```

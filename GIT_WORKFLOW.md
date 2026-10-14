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

## 5. Scenario: Undo a mistaken commit without losing work

Imagine you just committed a temporary change and realize it should not be part of the project yet. You can move the last commit back into the working area, inspect it, and decide what to keep.

```powershell
echo "temporary draft" >> notes.txt
git add notes.txt
git commit -m "Add temporary draft notes"
git log --oneline -n 2
git reset --soft HEAD~1
git status --short
```

`git reset --soft HEAD~1` moves the latest commit back to the staging area instead of deleting it entirely, so the work remains available. You can then review the change, adjust it, and either recommit or discard it.

```powershell
git diff --cached
# If the change is not needed:
git restore --staged notes.txt
git restore notes.txt
```

This pattern is useful when a commit was made too early or with the wrong content. It lets you correct the mistake while keeping the work in your local repository.

## 6. Scenario: Unstage a file before finalizing a commit

Sometimes a file is added to the index by accident and should remain in your working directory without being included in the next commit.

```powershell
echo "draft notes" > temp.txt
git add temp.txt
git status --short
git restore --staged temp.txt
git status --short
```

After `git restore --staged`, the file is no longer staged, but the content still remains in the working directory. This lets you keep editing without committing the file yet. If you want to remove the file completely, you can also run:

```powershell
git restore temp.txt
```

This is a useful step when reviewing changes before deciding what belongs in the next commit.

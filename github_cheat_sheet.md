## keywords
1. Repository: a central location where you can store and organize your project's files, including the source code, documentation, images, and any other assets. It serves as a version-controlled repository for tracking changes, collaborating with others, and managing the development of your project.
2. Branch: a lightweight movable pointer that represents an independent line of development within a repository. It allows developers to isolate changes, work on new features or bug fixes, and experiment with different ideas without impacting the main codebase. Branches in Git enable parallel development, collaboration, and easy management of different tasks.
3. Local repository: a repository that is stored on your local machine. It resides on your computer's hard drive or a networked file system that you have access to. When you clone a remote repository or initialize a new repository on your machine, it becomes a local repository.
4. Remote Repository: a repository that is located on a remote server or hosting service, such as GitHub, GitLab, or Bitbucket. It serves as a central location where developers can collaborate, share code, and synchronize their work.
5. Commit/Snapshot: Checkpoint in your local repo.
6. Push: upload local changes to remote.
7. Pull: pull changes from remote repo to local.
8. HEAD: a special pointer that represents the current commit or the current branch in your repository. It is essentially a reference to the tip of the branch you are currently on.
9. HEAD~<number>: commit before the head by <number>, for example Head~1 is the commit before the head.
## Commands
### Setup and Config

* To turn an existing directory into a new Git repository.
```cmd
git init
```

* Set the name you want attached to your commit transactions
```cmd
git config --global user.name "[name]"
```

* Set the email you want attached to your commit transactions
```cmd
git config --global user.email "[email address]"
```

* Enable helpful colorization of command line output
```cmd
git config --global color.ui auto
```

### Getting and Creating Projects

* To link the local repository to an empty GitHub repository 
```cmd
git remote add origin [url]
```

* clone a repository into a directory
```cmd
git clone [url] [directory]
```
### Basic Snapshotting
* Add file(s) contents from working tree to the index (staging area)
```cmd
git add [file]
git add -A
```

* Show the working tree status
```cmd
git status
```

* Show changes between commits, commit and working tree, branches, etc
```cmd
git diff <commit-hash-1> <commit-hash-2>
git diff <branch-name-1> <branch-name-2>
# Diff between the staging area(index) and the last commit:
git diff --staged
```

* Record changes saved in the saging area(index) to the repository
```cmd
git commit -m "comment"
```

* notes
```terminal
# add notes to commit
git notes add "note" <commit>
# show commit notes
git notes show <commit>
# to list all the notes in the repository
git notes list
```
to include notes in the push or pull commands use --notes flag.

* Restore: can be used to:
  1. undo the effect of git add (unstage changes).
  ```terminal
  git restore --staged <files>
  ```
  2. discard changes in a local file restoring its last commited state.
  ```terminal
  git restore <files>
  ```
  3. restore a specific file from a previous commit.
  ```terminal
  git restore <commit> -- <files>
  ```
  4. restore all files to the state of a specific commit.
  ```terminal
  git restore --source=<commit> .
  ```
  5. restore files from a specific branch or tag.
  ```terminal
  git restore --source=feature-branch -- file.txt
  ```
* Reset:
  1. Move the branch pointer to the specified commit, preserving the changes in the staging area and working directory. The changes from subsequent commits become unstaged, allowing you to recommit them.
  ```terminal
  git reset --soft <commit>
  ```
  2. Move the branch pointer to the specified commit, resetting the staging area to match the commit. The changes are kept in the working directory as unstaged changes.
  ```terminal
  git reset --mixed <commit>
  ```
  3. Move the branch pointer to the specified commit, resetting both the staging area and the working directory to match the commit. This discards all changes after the specified commit.
  ```terminal
  git reset --hard <commit>
  ```
  Can also be used to unstage changes:
  1. Remove the specified file(s) from the staging area, making them unstaged but preserving the changes in the working directory.
  ```terminal
  git reset <file>
  ```
  2. Remove all files from the staging area, making them unstaged. This does not discard any changes.
  ```terminal
  git reset
  ```
* Rm: can be used to:
  1. Remove files from the working tree and from the index
  ```terminal
  git rm <file>
  ```
  2. Remove a file from the repository but keep it in the working directory
  ```terminal
  git rm --cached <file>
  ```
  the -r tag means recursively which is used to remove a directory with all its contents.
* move or rename a file or directory in both the working directory and the Git repository. It is a convenient way to perform a file or directory rename while preserving the file's history.
```terminal
  git mv <source> <destination>
```

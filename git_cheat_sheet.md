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
10. Lightweight tags: pointers to specific commits and do not contain any additional metadata.
![alt text](https://cdn.hashnode.com/res/hashnode/image/upload/v1644871667728/U8uUkYIQa.png "Working Directory/staging area/repo")
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
  3. restore file to the state of a specific commit.
  ```terminal
  git restore --source=<commit> <files>
  ```
  4. restore files from a specific branch or tag.
  ```terminal
  git restore --source=<branch> <files>
  ```
  Note: in all of the last commands you can use dot "." instead of <files> to implement the command for all files
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

### Branching and Merging
* Branch: can be used to:
  1. List branches
  ```terminal
  git branch
  ```
  2. Create a new branch
  ```terminal
  git branch <branch-name>
  ```
  3. Rename a branch
  ```terminal
  git branch -m <old-branch-name> <new-branch-name>
  ```
  4. Delete a branch
  ```terminal
  git branch -d <branch-name>
  ```
* Checkout: can be used to:
  1. Switch to a branch
  ```terminal
  git checkout <branch-name>
  ```
  add -b flag to create the branch and switch to it.
  2. Overwrite working tree with the contents in the index (discard changes).
  ```terminal
  git checkout <files>
  ```
  3. Restore files from a specific commit
  ```terminal
  git checkout <commit> -- <file>
  ```
  4. Detach HEAD and checkout a specific commit
  ```terminal
  git checkout <commit>
  ```
  This command detaches the HEAD pointer from any branch and directly points to the specified <commit>.
  note: to undo this command write `git switch -`
  5. Switch to a remote branch
  ```terminal
  git checkout <remote>/<branch-name>
  ```
* Switch: can be used to:
  1. switch to a branch
  ```terminal
  git switch <branch-name>
  ```
  add -c flag to create the branch adn switch to it
  2. Restore files from a specific commit
  ```terminal
  git switch <commit> -- <file>
  ```
  if '-- <file>' is removed, it will Detach HEAD and switch to a specific commit. to  undo that write `git switch -`
* Merge: Join two or more development histories together:
  ```terminal
  # Switch to the branch where you want to merge changes
  git checkout <branch-to-merge-into>
  # Merge changes from another branch into the current branch
  git merge <branch-to-merge>
  # If you encounter issues during a merge and want to cancel it, you can use:
  git merge --abort
  ```
  When Git encounters conflicting changes during a merge, it pauses the merge process and highlights the conflicting sections in the affected files. You need to manually edit and resolve the conflicts by choosing which changes to keep. After resolving conflicts, save the files and stage them using git add, then run git merge --continue to complete the merge commit.
  It's important to note that the git merge command creates a new commit that represents the merge result.
* Log: show commit logs.
  ```terminal
  git log
  ```
* Stash: Stash the changes in a dirty working directory away
  ```terminal
  git stash
  # this command saves the current changes in your working directory in a new stash, and wil revert changes in the working directory
  ```
  to list stashed saved use:
  ```terminal
  git stash list
  # to apply specific stash:
  git stash apply <stash>
  #<stash> is optional and default is the last stash
  # to apply a stash and remove it use:
  git stash pop <stash> #default also is the last one.
  # to discard a stash
  git discard <stash>
  ```
* Tag: Create, list, delete or verify a tag object 
  ```terminal
  # List tags:
  git tag
  # Create Lightweight tag:
  git tag <tag-name>
  # Create annotated tag:
  git tag <tag-name> -m "tag message"
  # Create tag for specific commit:
  git tag <tag-name> <commit>
  # Show information about a tag:
  git show <tag-name>
  # By default, Git does not automatically push tags to remote repositories, to push tages:
  git push --tags
  ```

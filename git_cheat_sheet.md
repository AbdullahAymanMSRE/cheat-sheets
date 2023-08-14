# keywords
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
11. Stale branch: a remote-tracking branch that no longer tracks anything because the actual branch in the remote repository has been deleted.
![alt text](https://cdn.hashnode.com/res/hashnode/image/upload/v1644871667728/U8uUkYIQa.png "Working Directory/staging area/repo")
# Commands
## Setup and Config

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

## Getting and Creating Projects
* clone a repository into a directory
```cmd
git clone [url] [directory]
```
## Basic Snapshotting
### Add:
Add file(s) contents changed in the working tree to the index (staging area)
```cmd
git add [file]
git add -A
```

### Status:
provide you with a summary of the current state, including branch information, staging area and untracked files.
```cmd
git status
```

### Diff:
show the differences between different states in your Git repository such as commits, commit and working tree, branches, etc.
Here are some of its use cases:
  1. diff between two commits:
  ```git
  git diff <commit1> <commit2>
  ```
  2. diff between working tree and the staging are:
  ```cmd
  git diff
  ```
  3. diff between staging area and last commit:
  ```git
  git diff --staged
  ```
  4. diff between specific commit and working directory:
  ```git
  git diff <commit>
  ```

### Commit: some of its use cases are
  1. Record changes saved in the saging area(index) to the repository
  ```cmd
  git commit -m "comment"
  ```
  2. Add changes to the previous commit or modify the commit message
  ```cmd
  git commit --amend 
  ```

### notes
```terminal
# add notes to commit
git notes add -m "note" <commit>
# show commit notes
git notes show <commit>
# to list all the notes in the repository
git notes list
```
to include notes in the push or pull commands add refs/notes/commits at the end of the command.

### Restore: can be used to:
  1. undo the effect of git add (unstage changes).
  ```terminal
  git restore --staged <files>
  ```
  2. discard changes in a local file restoring its last commited state.
  ```terminal
  git restore <files>
  ```
  3. restore file to the state of a specific commit or branch.
  ```terminal
  git restore --source=<commit-or-branch> <files>
  ```
  Note: in all of the last commands you can use dot "." instead of <files> to implement the command for all files
### Reset:
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
### Rm: can be used to:
  1. Remove files from the working tree and from the index
  ```terminal
  git rm <file>
  ```
  2. Remove a file from the repository but keep it in the working directory
  ```terminal
  git rm --cached <file>
  ```
  the -r tag means recursively which is used to remove a directory with all its contents.
### Mv:
move or rename a file or directory in both the working directory and the Git repository. It is a convenient way to perform a file or directory rename while preserving the file's history.
```terminal
  git mv <source> <destination>
```

## Branching and Merging
### Branch: can be used to:
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
  5. Show branches that has/has not been merged to current branch
  ```terminal
  git branch --merged
  git branch --no-merged  
  ```
### Checkout: can be used to:
  1. Switch to a branch. Add -b flag to create the branch and switch to it.
  ```terminal
  git checkout <branch-name>
  ```
  2. Overwrite working tree with the contents in the index (discard changes).
  ```terminal
  git checkout <files>
  ```
  3. Restore files from a specific commit
  ```terminal
  git checkout <commit> -- <file>
  ```
  4. Detach HEAD and checkout a specific commit. This command detaches the HEAD pointer from any branch and directly points to the specified <commit>.
  note: to undo this command write `git switch -`
  ```terminal
  git checkout <commit>
  ```
  
  5. Switch to a remote branch
  ```terminal
  git checkout <remote>/<branch-name>
  ```
### Switch: 
it is used to switch to a branch. Add -c flag to create the branch and switch to it
  ```terminal
  git switch <branch-name>
  ```
### Merge: 
Join two or more development histories together. For example to Merge changes from another branch into the current branch:
  ```terminal
  git merge <branch-to-merge>
  ```
  * We can have two cases in the above command:
    1. First case: when the current branch have some new commits and the merged branch also has new commit. `git merge` in this case creates a new commit for the merge as shown in the image:
    ![alt text](https://wac-cdn.atlassian.com/dam/jcr:c6db91c1-1343-4d45-8c93-bdba910b9506/02%20Branch-1%20kopiera.png?cdnVersion=1160").
    2. Second case: when there is a linear path from the current branch tip to the target branch. Instead of “actually” merging the branches, all Git has to do to integrate the histories is move (i.e., “fast forward”) the current branch tip up to the target branch tip. This is called fast forward merge as shown below:
    ![alt text](https://wac-cdn.atlassian.com/dam/jcr:d90f2536-7951-4e5e-ab79-f45a502fb4c8/03-04%20Fast%20forward%20merge.svg?cdnVersion=1160)
  
  * Some important flags:
    1. --no-ff: stands for no fast forwarding. It creates a new commit for the merge even if fast forward merging is possible.
  * Merge conflicts:
    When Git encounters conflicting changes during a merge, it pauses the merge process and highlights the conflicting sections in the affected files. You need to manually edit and resolve the conflicts by choosing which changes to keep. After resolving conflicts, save the files and stage them using git add, then run `git merge --continue` to complete the merge commit.
    If you encounter issues during a merge and want to cancel it, you can use `git merge --abort`.
### Log: show commit logs.
  ```terminal
  git log
  ```
  --oneline flag to show each commit in one line.
### Stash: Stash the changes in a dirty working directory away
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
  git stash drop <stash>
  ```
### Tag: Create, list, delete or verify a tag object 
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
## Sharing and Updating Projects
### Fetch:
 retrieve and download the latest changes from a remote repository without merging them into your local branches. updates the remote tracking branches in your local repository. These branches, usually named origin/<branch-name>. you can examine the fetched changes using commands like `git log origin/<branch-name>`
  ```terminal
  git fetch <remote> <branch>
  ```
  <remote> and <branch> are optional.

### Pull:
It is a combination of two commands: git fetch and git merge. 
  ```terminal
  git pull <remote> <branch>
  ```

  * Some important flags:
    1. --rebase: Fetching changes from the remote repository. but then instead of merging you make a rebase so that we have a linear commit history.
    2. --ff-only: If the remote branch has additional commits that are not in your local branch, the command will fail instead of creating a merge commit.
    3. --no-commit: Fetches the changes but doesn't automatically create a merge commit. It leaves the changes after mergin as uncommitted.

### Push:
is used to upload local branch commits to a remote repository.
```git
git push <remote> <branch>
```
* -u flag sets up the remote branch as the upstream branch for your local branch. It enables you to use git pull and git push without specifying the remote and branch names in the future.
--tags and --notes were metioned earlier in this file.

### Remote:
Manage set of tracked repositories, and here are some useful use cases:
  * To list remote repos:
  ```cmd
  git remote -v
  ```

  * To link the local repository to an empty GitHub repository. After executing this command the <url> will be saved as a remote repo with the name <name>.
  ```cmd
  git remote add <name> <url>
  ```

  * To change the url of an existing remote use:
  ```cmd
  git remote set-url <name> <url>
  ```

  * To show the url of an existing remote:
  ```cmd
  git remote get-url <name> 
  ```

  * Rename a saved remote repo: 
  ```git
  git remote rename <old> <new>
  ```

  * Remove a saved remote repo:
  ```git
  git remote remove <name>
  ```


## Inspection and Comparison
### Show:
to display detailed information about a specific Git object, such as a commit, tag, or tree.
  ```terminal
  git show <object>
  ```
### Describe:
The result is a "human-readable" object name which can also be used to identify the commit to other git commands.
```git
git describe <commit>
```

The output of `git describe` typically consists of the following components:

1. The closest annotated tag name.
2. The number of additional commits beyond the annotated tag.
3. An abbreviated commit hash.

## Patching
### rebase:
apply a sequence of commits on top of another branch. It allows you to incorporate changes from one branch into another, potentially rewriting the commit history.

Assume the following history exists and the current branch is "topic":

          A---B---C topic
         /
    D---E---F---G master

From this point, the result of the following command if run in the topic branch:
```git
git rebase master
```
would be:

                    A'--B'--C' topic
                 /
    D---E---F---G master

Assume again the following history:

          A---B---C topic
         /
    D---E---F---G master
    
however this time we will assume that the current branch is master. If we run:
```git
git rebase topic
```
would be:

                       topic
                     /
    D---E---A---B---C---F---G master
    
In case of conflict, `git rebase` will stop at the first problematic commit and leave conflict markers in the tree, After resolving the conflict manually and updating the index with the desired resolution, you can continue the rebasing process with
```git
git rebase --continue
```
Alternatively, you can undo the git rebase with
```git
git rebase --abort
```

### revert:
Revert(delete) some existing commits
```git
git revert <commit1> <commit2> ...
```
can also use `--continue` and `--abort` for dealing with conflicts like `rebase`

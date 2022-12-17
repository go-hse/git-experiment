# git-experiment
## Experimental usage of git commands
The Windows batch file playgit.bat
- shows the remote repos 
- reads a batch file with the current build number, if it exists
- saves the batch file with the current build number
- creates a dummy file
- check the git status
- diffs working dir vs. staged 
- tracks/stages the files with git add 
- unstages the dummy file with git reset 
- shows the last changes (git log) 
- commits the stage to the repo 
- pushes everything to github 
- and creates this README file 


## Commands

```
# Start SSH agent
eval "$(ssh-agent -s)"

# Add identity
ssh-add ~/.ssh/id_hse

# Test identity
ssh -T -i ~/.ssh/id_hse git@github.com

# Check remote host, maybe wrong if cloned via HTTPS
git remote -v
git remote set-url origin git@github.com:go-hse/mci2w22
```

## Config

```
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

git config --global user.name "Andreas Roessler"
git config --global user.email "andreas.roessler@hs-esslingen.de"
```

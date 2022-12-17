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

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_hse
ssh -T -i ~/.ssh/id_hse git@github.com


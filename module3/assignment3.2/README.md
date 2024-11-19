![Alt Text](https://github.com/lann87/cloud_infra_eng_ntu_coursework_alanp/blob/main/.misc/ntu_logo.png)  

# Assignment 3.2 - Introduction to GIT II  

## Individual Assignment - GitHub Authentication and GIT Commands  

**Date**: 02 Oct  
**Author**: Alan Peh  

## GitHub-Security-Best-Practices

### GitHub Authentication Methods

| Method | Description | Best Used For |
|--------|-------------|---------------|
| Personal Access Tokens (PAT) | Long-lived tokens with specific permissions | CLI operations, API access, and automated tasks |
| SSH Keys | Secure key pairs for git operations | Secure repository access without password |
| HTTPS with 2FA | Username + password with two-factor authentication | Web interface access with added security |
| GitHub CLI | Authenticate using `gh auth login` | Command line interface operations |
| OAuth Apps | Third-party application access | Integration with external services |

### Setting Up Authentication  

1. **Personal Access Tokens (PAT)**  
   - Go to Settings > Developer settings > Personal access tokens  
   - Choose token type (Classic or Fine-grained)  
   - Select required permissions  
   - Store token securely  

2. **SSH Keys**  

   ```bash
   # Generate SSH key
   ssh-keygen -t ed25519 -C "your_email@example.com"
   
   # Add to ssh-agent
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   
   # Add public key to GitHub account
   ```

## Essential GitHub Commands

| Command | Usage | Description |
|---------|-------|-------------|
| `git init` | Repository setup | Initialize a new Git repository |
| `git clone [url]` | Repository setup | Create local copy of remote repository |
| `git add [file]` | File tracking | Add file(s) to staging area |
| `git commit -m "[message]"` | Saving changes | Record changes to repository |
| `git push origin [branch]` | Syncing | Upload local branch to remote |
| `git pull origin [branch]` | Syncing | Download and merge remote changes |
| `git branch [name]` | Branch management | Create new branch |
| `git checkout [branch]` | Branch management | Switch to specified branch |
| `git merge [branch]` | Branch management | Combine branches |
| `git status` | Monitoring | Check working directory status |
| `git log` | History | View commit history |
| `git fetch` | Syncing | Download remote changes without merging |
| `git remote add origin [url]` | Remote management | Connect local to remote repository |
| `git reset --hard [commit]` | Recovery | Reset to specific commit |
| `git stash` | Temporary storage | Store temporary changes |

## Most Used Commands in Real Projects  

### 1. `git pull origin [branch]`  

**Why**: Essential for team collaboration  

- Keeps local repository synchronized with remote  
- Prevents merge conflicts by staying updated  
- Regular pulls maintain code consistency  

### 2. `git commit -m "[message]"`  

**Why**: Critical for version control  

- Documents changes with meaningful messages  
- Creates checkpoints in development  
- Enables tracking of feature implementation  
- Facilitates code review and debugging  

### 3. `git push origin [branch]`  

**Why**: Required for sharing work  

- Shares code with team members  
- Updates remote repository  
- Enables continuous integration processes  
- Backs up local changes  

### 4. `git branch` / `git checkout`  

**Why**: Fundamental for feature development  

- Enables parallel development streams  
- Isolates new features from main code  
- Facilitates code review process  
- Maintains stable main branch  

## Best Practices  

1. Always pull before starting new work  
2. Create descriptive commit messages  
3. Use feature branches for new development  
4. Regularly push to remote to backup work  
5. Keep authentication credentials secure  
6. Enable 2FA for additional security  

## Security Notes  

- Never commit sensitive information  
- Rotate access tokens periodically  
- Review repository access permissions regularly  
- Use environment variables for sensitive data  
- Implement branch protection rules  

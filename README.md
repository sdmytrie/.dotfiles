# Config for dotfiles

## Commandes utiles

```
    git-dotfiles config --local status.showUntrackedFiles no  
    git init --bare /opt/Tools/git-bare/dotfiles/  
    alias git-dotfiles='git --git-dir=/opt/Tools/git-bare/dotfiles --work-tree=/home/serge'  
    mongo --host localhost -u admin -p --authenticationDatabase admin
```

## Package  

```
    linux-generic-hwe-18.04
```

## Configure i3 and X11
arand + xrand
xprop --> get class
lxappearance --> gtk3   

infinality --> displays better font

on the web, search moka for icons
   
## ZSH  

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"  
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k  
p10k configure

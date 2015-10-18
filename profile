# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
    if [ -f "$HOME/.bash_profile_local" ]; then
	. "$HOME/.bash_profile_local"
    fi
    if [ -f "$HOME/dotfiles/git-prompt.sh" ]; then
	. "$HOME/dotfiles/git-prompt.sh"
    fi
    if [ -f "$HOME/dotfiles/git-completion.bash" ]; then
	. "$HOME/dotfiles/git-completion.bash"
    fi
fi

# include sbin in PATH
if [ -d "/sbin" ] ; then
    PATH="/sbin:$PATH"
fi
if [ -d "/usr/sbin" ] ; then
    PATH="/usr/sbin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi



#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/abuckeridge/.gvm/bin/gvm-init.sh" ]] && source "/Users/abuckeridge/.gvm/bin/gvm-init.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/abuckeridge/.sdkman"
[[ -s "/Users/abuckeridge/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/abuckeridge/.sdkman/bin/sdkman-init.sh"

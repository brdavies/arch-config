# Path to your oh-my-zsh configuration.
ZSH=$HOME/.config/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bendavies"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Don't share history between terminals.
unsetopt share_history

# Customize to your needs...
TERM=screen-256color

# Don't bloody auto-correct 'git st' thank you very much.
alias git="nocorrect git"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lh'
alias lt='tree -dL'

# Make sure sudo has the same path as user.
alias sudo='sudo env PATH=$PATH'

# Single and dual monitor configurations.
alias two='xrandr --auto; xrandr --auto --output HDMI-0 --left-of DVI-0; ratpoison -c restart'

# Too lazy to type 'cd ..'...
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

# Change to the current directory. This is useful for staying in a directory
# that was deleted and recreated (e.g. a build output directory).
alias cdd='cd `pwd`'

# Print all processes that belong to a group.
alias ps-group='ps x -o  "%p %r %y %x %c "'

# Recursively search, print line numbers.
alias rgrep='grep -R -n'

# 'pps' is like 'pgrep -l' (print command as well as pid) but it prints the
# whole command line.
pps () { pgrep "$1" | xargs ps; }

export GREP_OPTIONS="--color=auto"
export GREP_COLORS="ms=01;37:mc=01;37:sl=:cx=01;30:fn=35:ln=32:bn=32:se=36"

# Start ssh-agent and add private key for the current machine.
alias ssh-start='eval $(ssh-agent) && ssh-add ~/.ssh/id_rsa && ssh-add ~/.ssh/ben.davies@alcolizer.com'

alias sync-time='sudo ntpd -qg'

# Actinium project related stuff.
alias ac-host='pushd ~/ac/fs/tmp-host/rootfs/ac'
PATH=$PATH:~/ac/fs/tmp-host/rootfs/ac:~/.config/zsh/scripts

# This function is a wrapper around dbquery that prints key names to a temporary
# file. Any arguments supplied to this function are passed directly to dbquery.
dbqueryx() {

    # Keys are written to this file.
    tmp=`mktemp`

    # Call dbquery, instructing it to print key names to the temporary file.
    dbquery --key-file ${tmp} $@

    # The temporary file contains one or more lines that look like
    # 'shortcut=key'. Evaluate this line so the environmental variable is
    # exported.
    while read line
    do
        eval "export ${line}"
    done < ${tmp}

    # Delete the temporary file.
    rm ${tmp}
}

# Look up a password challenge and write the result to stdout and to the
# clipboard.
passx() {
    ret=`pass $@`
    echo ${ret}
    echo -e ${ret} | xclip -selection clipboard
}

copy() {
    $@ | xclip -selection clipboard
}

reset-network() {
    echo "eth0 down..."
    sudo ip link set dev eth0 down
    echo "eth0 up..."
    sudo ip link set dev eth0 up
    echo "renew ip..."
    sudo systemctl restart dhcpcd@eth0.service
    ping -c 3 8.8.8.8
}

alias dbq='dbqueryx -h thorium'
alias dbqh='dbqueryx'

# redis-cli connecting directory to thorium hardware.
alias rcli='redis-cli -h thorium -a "`pass --redis thorium`"'

# redis-cli connecting directory to host.
alias rclih='redis-cli -a "`pass --redis`"'

# Compress a directory.
pack-dir() {
    name=`basename $1`
    tar -czvf ${name}.tgz $1
}

# Default golang workspace.
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# Use rsync to move and copy
alias rscp='rsync -aP'
alias rsmv='rsync -aP --remove-source-files'

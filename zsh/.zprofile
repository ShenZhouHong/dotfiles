#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
#
# Editors
#

export EDITOR='nvim'
export BROWSER='/usr/bin/firefox'
export VISUAL='nvim'
export PAGER='less'
# export TERM="rxvt-unicode-256color"

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
# path=(
#   $HOME/bin
#   /usr/local/heroku/bin
#   /usr/local/{bin,sbin}
#   $HOME/.dotfiles
#   $path
# )

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
# export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
#export PATH="$HOME/bin:/home/pinusc/.gem/ruby/2.2.0/bin:$PATH"
# export PATH="/usr/local/heroku/bin:$HOME/.dotfiles:$PATH"
if [[ ! $DISPLAY && XDG_VTNR -eq 1 ]]; then
    exec startx
fi

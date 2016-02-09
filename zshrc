source $HOME/.zprofile
# load zgen
source "${HOME}/builds/zgen/zgen.zsh"

# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    # prezto options
    zgen prezto editor key-bindings 'vim'
    zgen prezto prompt theme 'sorin'

    # prezto and modules
    zgen prezto
    zgen prezto git
    zgen prezto syntax-highlighting

    # completions
    zgen load zsh-users/zsh-completions src

    # save all to init script
    zgen save
fi


BASE16_SHELL="$HOME/.config/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
#
# # Customize to your needs...
source ~/.zsh_aliases

alias lrvm='[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"'

# For DuckPAN
alias lduckpan='eval $(perl -I${HOME}/perl5/lib/perl5 -Mlocal::lib)'

fasd_cache="$HOME/.fasd-init-bash"
if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
  fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install >| "$fasd_cache"
fi
source "$fasd_cache"
unset fasd_cache

source ~/builds/zsh-autoenv/autoenv.zsh
#
# virtalenvwrapper
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/Devel
# source /usr/bin/virtualenvwrapper.sh

# ls colors: eliminate that ugly green background
eval "$(dircolors ~/.config/dircolors)";

export TERM="xterm-256color"
prompt sorin

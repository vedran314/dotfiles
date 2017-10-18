# Path to your oh-my-zsh installation.
#
export ZSH=/Users/Vedran/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="juanghurtado"
export TERM=xterm-256color

function extract {
  echo Extracting $1 ...
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xjf $1  ;;
          *.tar.gz)    tar xzf $1  ;;
          *.bz2)       bunzip2 $1  ;;
          *.rar)       rar x $1    ;;
          *.gz)        gunzip $1   ;;
          *.tar)       tar xf $1   ;;
          *.tbz2)      tar xjf $1  ;;
          *.tgz)       tar xzf $1  ;;
          *.zip)       unzip $1   ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1  ;;
          *)        echo "'$1' cannot be extracted via extract()" ;;
      esac
  else
      echo "'$1' is not a valid file"
  fi
} 

unset MAILCHECK
export EDITOR='vim'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
# 

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(node zsh-syntax-highlighting npm sublime  extract web-search git dircycle encode64 osx colored-man common-aliases sudo history-substring-search command-not-found cp)
# User configuration

#export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
#
## -------------------------------------------------------------------
#     https://github.com/jleclanche/dotfiles/blob/master/.zshrc
## -------------------------------------------------------------------
# Keep 1000 lines of history within the shell and save it to ~/.cache/shell_history
HISTSIZE=100  
SAVEHIST=100 
HISTFILE="$XDG_CACHE_HOME/shell_history"

# shell options
setopt autocd # assume "cd" when a command is a directory
setopt histignorealldups # Substitute commands in the prompt
setopt sharehistory # Share the same history between all shells
setopt promptsubst # required for git plugin
# setopt extendedglob
# Extended glob syntax, eg ^ to negate, <x-y> for range, (foo|bar) etc.
# Backwards-incompatible with bash, so disabled by default.

# Color aliases
if command -V dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
  # Only alias ls colors if dircolors is installed
  alias ls="ls -F --color=auto"
  alias dir="dir --color=auto"
  alias vdir="vdir --color=auto"
fi

# make less accept color codes and re-output them
alias less="less -R"
alias zshrc="vim ~/.zshrc"
alias szshrc="source ~/.zshrc"


# 256 color mode

# Color aliases
if command -V dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
  # Only alias ls colors if dircolors is installed
  alias ls="ls -F --color=auto"
  alias dir="dir --color=auto"
  alias vdir="vdir --color=auto"
fi

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"
# make less accept color codes and re-output them
alias less="less -R"
alias cl="clear"

# Make ctrl-e edit the current command line
#autoload edit-command-line
#zle -N edit-command-line
#bindkey "^e" edit-command-line

# Make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init {
    printf "%s" ${terminfo[smkx]}
  }
  function zle-line-finish {
    printf "%s" ${terminfo[rmkx]}
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# typing ... expands to ../.., .... to ../../.., etc.
rationalise-dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
zle -N rationalise-dot
bindkey . rationalise-dot
bindkey -M isearch . self-insert # history search fix
##
# Aliases
#

# some more ls aliases
alias l="ls -CF"
alias ll="ls -lh"
alias la="ls -A"
alias sl="ls"

# Make unified diff syntax the default
alias diff="diff -u"

# simple webserver
alias mkhttp="python -m http.server"

# json prettify
alias json="python -m json.tool"

# octal+text permissions for files
alias perms="stat -c '%A %a %n'"

# expand sudo aliases
alias sudo="sudo "
alias calhg="cal | grep --color -EC6 '\b$(date +%e | sed 's/ //g')' "

##
# Functions
#


# display a list of supported colors
function lscolors {
  ((cols = $COLUMNS - 4))
  s=$(printf %${cols}s)
  for i in {000..$(tput colors)}; do
    echo -e $i $(tput setaf $i; tput setab $i)${s// /=}$(tput op);
  done
}

# get the content type of an http resource
function htmime {
  if [[ -z $1 ]]; then
    print "USAGE: htmime <URL>"
    return 1
  fi
  mime=$(curl -sIX HEAD $1 | sed -nr "s/Content-Type: (.+)/\1/p")
  print $mime
}

# open a web browser on google for a query
function google {
  xdg-open "https://www.google.com/search?q=`urlencode "${(j: :)@}"`"
}

# print a separator banner, as wide as the terminal
function hr {
  print ${(l:COLUMNS::=:)}
}

# launch an app
function launch {
  type $1 >/dev/null || { print "$1 not found" && return 1 }
  $@ &>/dev/null &|
}
alias launch="launch " # expand aliases

# urlencode text
function urlencode {
  print "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

# get public ip
function myip {
  local api
  case "$1" in
    "-4")
      api="http://v4.ipv6-test.com/api/myip.php"
      ;;
    "-6")
      api="http://v6.ipv6-test.com/api/myip.php"
      ;;
    *)
      api="http://ipv6-test.com/api/myip.php"
      ;;
  esac
  curl -s "$api"
  echo # Newline.
}

# Create short urls via http://goo.gl using curl(1).
# Contributed back to grml zshrc
# API reference: https://code.google.com/apis/urlshortener/
function zurl {
  if [[ -z $1 ]]; then
    print "USAGE: $0 <!-- <URL> -->"
    return 1
  fi

  local url=$1
  local api="https://www.googleapis.com/urlshortener/v1/url"
  local data

  # Prepend "http://" to given URL where necessary for later output.
  if [[ $url != http(s|)://* ]]; then
    url="http://$url"
  fi
  local json="{\"longUrl\": \"$url\"}"

  data=$(curl --silent -H "Content-Type: application/json" -d $json $api)
  # Match against a regex and print it
  if [[ $data =~ '"id": "(http://goo.gl/[[:alnum:]]+)"' ]]; then
    print $match
  fi
}


### -------------------------------------------------------------------
#     ./https://github.com/jleclanche/dotfiles/blob/master/.zshrc
## -------------------------------------------------------------------
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias ls="ls -alh -G"


## -------------------------------------------------------------------
#     Git aliases
## -------------------------------------------------------------------

alias ga='git add -A'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
alias a2r='sudo apachectl restart'
alias a2s='sudo apachectl stop'
alias a2st='sudo apachectl start'
alias sha1='openssl sha1'
alias rsync="rsync --update -raz --progress"
alias rsync-dry="rsync --update -raz --progress --dry-run"
alias drive="gdrive"
alias driveupload="gdrive upload"
alias driveshare="gdrive upload --share"



cdf() {
    target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
    if [ "$target" != "" ]; then
        cd "$target"; pwd
    else
        echo 'No Finder window found' >&2
    fi
}



alias diff='colordiff'
alias node-server="http-server -o --cors"
export PATH="$PATH:$HOME/scripts"
. /usr/local/bin/z.sh


#SSH
#export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
#MYSQL Server
#NOVO SHARE
alias  go="google"
alias  del="rmtrash"
alias  j="jump"
alias vim="nvim"
alias optijpg='find . -name "*.jpg" -exec jpegoptim -m60 -o -p --strip-all {} \;'


export GISTY_ACCESS_TOKEN=51b4295e21f2f11f41657220e8b480a24656a19a


#Composer get localy
alias getcomposer="curl -sS https://getcomposer.org/installer | php"
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

#AMPPS Paths
#export PATH=/Applications/AMPPS/php/bin:$PATH
#export PATH=/Applications/AMPPS/mysql/bin:$PATH

#export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:/Users/vedran/bin:/$HOME/.rbenv/bin:$PATH
export PATH=~/.composer/vendor/bin:$PATH



######################################################################################################################
#fzf
######################################################################################################################
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

  # fbr - checkout git branch
  fbr() {
    local branches branch
    branches=$(git branch -vv) &&
    branch=$(echo "$branches" | fzf +m) &&
     git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
  }
  # fcoc - checkout git commit
  fcoc() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf --tac +s +m -e) &&
    git checkout $(echo "$commit" | sed "s/ .*//")
  }

  # fcs - get git commit sha
  # example usage: git rebase -i `fcs`
  fcs() {
    local commits commit
    commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
    commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
    echo -n $(echo "$commit" | sed "s/ .*//")
  }

  # Modified version where you can press
  #   - CTRL-O to open with `open` command,
  #   - CTRL-E or Enter key to open with the $EDITOR
  fo() {
     local out file key
     IFS=$'\n' out=($(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e))
     key=$(head -1 <<< "$out")
     file=$(head -2 <<< "$out" | tail -1)
     if [ -n "$file" ]; then
        [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-nvim} "$file"
     fi
  }

 # fcd - cd to selected directory
  fcd() {
    local dir
    dir=$(find ${1:-*} -path '*/\.*' -prune \
      -o -type d -print 2>/dev/null | fzf +m) &&
      cd "$dir"
  }

 # fcda - including hidden directories
  fcda() {
    local dir
    dir=$(find ${1:-.} -type d 2>/dev/null | fzf +m) && cd "$dir"
  }

  # cdf - cd into the directory of the selected file
  fcdf() {
    local file
    local dir
    file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
  }

  # fh - repeat history
  fh() {
   eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
  }
  # fkill - kill process
  fkill() {
   local pid
   pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

   if [ "x$pid" != "x" ]
   then
     echo $pid | xargs kill -${1:-9}
   fi
  }
  # Better Z
  unalias z 2> /dev/null
  z() {
   [ $# -gt 0 ] && _z "$*" && return
   cd "$(_z -l 2>&1 | fzf --height 40% --nth 2.. --reverse --inline-info +s --tac --query "${*##-* }" | sed 's/^[0-9,.]* *//')"
  }


  # Search through your LastPass vault with LastPass CLI and copy password to
  # clipboard.
  


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
######################################################################################################################
#./fzf
######################################################################################################################
case $- in *i*)
         if [ -z "$TMUX" ]; then exec tmux; fi;;
esac

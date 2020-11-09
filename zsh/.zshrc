# Bullet-train custom settings
BULLETTRAIN_STATUS_FG=black
BULLETTRAIN_DIR_FG=black
BULLETTRAIN_NVM_FG=black
BULLETTRAIN_GIT_FG=white
BULLETTRAIN_GIT_BG=black
BULLETTRAIN_GIT_ADDED="%F{green} ✚%F{$BULLETTRAIN_GIT_FG}"
BULLETTRAIN_GIT_MODIFIED="%F{blue} ✹%F{$BULLETTRAIN_GIT_FG}"
BULLETTRAIN_GIT_DELETED="%F{red} ✖%F{$BULLETTRAIN_GIT_FG}"
BULLETTRAIN_GIT_UNTRACKED="%F{yellow} ✭%F{$BULLETTRAIN_GIT_FG}"
BULLETTRAIN_GIT_AHEAD="%F{blue} ⬆%F{$BULLETTRAIN_GIT_FG}"
BULLETTRAIN_GIT_BEHIND="%F{blue} ⬇%F{$BULLETTRAIN_GIT_FG}"
BULLETTRAIN_GIT_DIVERGED="%F{blue} ⬍%F{$BULLETTRAIN_GIT_FG}"
BULLETTRAIN_GIT_RENAMED="%F{blue} ➜%F{$BULLETTRAIN_GIT_FG}"

BULLETTRAIN_PROMPT_ORDER=(
  time
  status
  git
  dir
  screen
  virtualenv
  aws
  cmd_exec_time
)

#add path with completions
fpath+=~/.zfunc

source /usr/share/zsh/share/antigen.zsh
antigen init $HOME/.antigenrc

export ANDROID_HOME=$HOME/Android/Sdk
export PATH="${PATH}:$ANDROID_HOME/tools"
export PATH="${PATH}:$ANDROID_HOME/platform-tools"
export PATH="${PATH}:/opt/depot_tools"

export GIT_CACHE_PATH="${HOME}/git_cache"

export ERL_AFLAGS="-kernel shell_history enabled"

# enable asdf
. $HOME/.asdf/asdf.sh
# add asdf completions to fpath
fpath=(${ASDF_DIR}/completions $fpath)
# run compinit
autoload -Uz compinit && compinit

# Fix Elixir sytem version under asdf
export MIX_HOME="$HOME/.mix"
export MIX_ARCHIVES="$MIX_HOME/archives"

export PATH="$PATH:$MIX_HOME/escripts"

export VISUAL=nvim
export EDITOR=nvim
alias nvim-config="nvim ~/.config/nvim/init.vim"

bindkey '\e[1~'   beginning-of-line  # Linux console
bindkey '\e[H'    beginning-of-line  # xterm
bindkey '\eOH'    beginning-of-line  # gnome-terminal
bindkey '\e[2~'   overwrite-mode     # Linux console, xterm, gnome-terminal
bindkey '\e[3~'   delete-char        # Linux console, xterm, gnome-terminal
bindkey '\e[4~'   end-of-line        # Linux console
bindkey '\e[F'    end-of-line        # xterm
bindkey '\eOF'    end-of-line        # gnome-terminal

source /usr/share/fzf/key-bindings.zsh

alias docker-start='sudo systemctl start docker'
alias docker-stop='sudo systemctl stop docker'

function mkcd() {
  mkdir -p $1 && cd $1
}

function docker-console {
  docker exec -ti $1 /bin/bash
}

function add-mix-githooks() {
  if [ ! -d .git ]; then
    echo "Run this from repo root"
    return -1
  fi

  PRE_COMMIT='.git/hooks/pre-commit'
  PRE_PUSH='.git/hooks/pre-push'
  if [ -f $PRE_COMMIT ] || [ -f $PRE_PUSH ]; then
    echo "Hooks already exist"
    return -1
  fi

  echo "#!/bin/bash" > $PRE_COMMIT
  echo "set -e" > $PRE_COMMIT
  echo 'mix format --check-formatted $(git diff --cached --name-only | grep -E '"'"'*\.exs?$'"'"')' >> $PRE_COMMIT
  chmod +x $PRE_COMMIT

  echo "#!/bin/bash" > $PRE_PUSH
  echo "set -e" > $PRE_PUSH
  echo "mix test" >> $PRE_PUSH
  chmod +x $PRE_PUSH
}

alias shrug="echo '¯\_(ツ)_/¯'"
alias cbcopy='xsel -ib'
alias cbpaste='xsel -ob'
alias sl=ls

alias ssh="TERM=xterm ssh"

alias gpf='git push --force-with-lease'
alias gpwt='git push && git push --tags'

function git-prune-merged() {
  return $(
    git branch -r |
    awk '{print $1}' |
    egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) |
    awk '{print $1}' |
    xargs git branch -d
  )
}

function git-prune-squashed() {
  git checkout -q master
  branches=`git for-each-ref refs/heads/ "--format=%(refname:short)"`

  for branch in $branches; do
    mergeBase=$(git merge-base master $branch) &&
    (if [[ $(git cherry master $(git commit-tree $(git rev-parse $branch\^{tree}) -p $mergeBase -m _)) == "-"* ]]; then
      git branch -D $branch;
      fi)
  done
}

source $HOME/.zsh/*.zsh

if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$PATH:$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"
fi

eval $(thefuck --alias)

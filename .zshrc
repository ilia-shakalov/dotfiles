export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.config/.oh-my-zsh"

ZSH_THEME="my"
DISABLE_UPDATE_PROMPT="true"

plugins=(
  git
  npm
  yarn
)

alias gs="git status"
alias gsu="git submodule update --recursive"
alias g3="git log --graph --oneline --all"
alias gl="git log"
alias gcd="git checkout develop"
alias gsta="git stash"
alias gsp="git stash pop"
alias gal="git add -A"
alias gp="git pull"
alias wo="cd ~/Desktop/work"
alias goc="cd ~/Desktop/work/client/"
alias gos="cd ~/Desktop/work/server/"
alias goi="cd ~/Desktop/side-projects/icewind/"
alias et="v ~/.tmux.conf"
alias ea="v ~/.alacritty.toml"
alias ep="v ~/.zshrc && source ~/.zshrc"
alias ev="v ~/.config/nvim/lua/custom/"
alias v="nvim"
alias tr="tmux kill-server"
alias ss="gos && npm run watch"
alias sc="goc && npm run local"
alias awsl="awslocal --endpoint-url=http://localhost:4566 --region eu-north-1"
alias kubectl="minikube kubectl --"
alias kb="kubectl"

function fbr() {
  description=("${(@)@:#-*}");
  branch_suffix="${description// /_}"
  git checkout -b ilya_s/PLAT-$branch_suffix;
}

function tbr() {
  description=("${(@)@:#-*}");
  branch_suffix="${description// /_}"
  git checkout -b ilya_s/$branch_suffix;
}

function gfc() {
  description=("${(@)@:#-*}");
  git checkout $(git branch | grep $description);
}

function crel() {
  git checkout release/$1;
}

function gcomm() {
  task=$(git symbolic-ref HEAD | cut -d'/' -f4 | cut -d'_' -f1 | grep PLAT);
  tmp_file="${HOME}/.git-messages/tmp_template.txt";
  description=("${(@)@:#-*}");
  echo -n > $tmp_file;
  if [ -z "$task" ]; then
    echo "type: $description" >> $tmp_file;
  else
    echo "type: [$task] $description" >> $tmp_file;
  fi
  git commit --template $tmp_file;
  rm $tmp_file;
}

function gpush() {
  branch=$(git symbolic-ref HEAD | cut -d'/' -f3,4);
  git push --set-upstream origin $branch;
}

source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'
export PATH=/Users/savvas/Library/Python/3.9/bin/:$PATH

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

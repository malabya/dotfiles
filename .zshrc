ZSH_DISABLE_COMPFIX=true
export ZSH="/Users/malabyatewari/.oh-my-zsh"
[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh 
export PATH=/Users/malabyatewari/.gem/bin/:$PATH
export PATH=/Users/malabyatewari/.nvm/versions/node/v14.2.0/bin/diff-so-fancy:$PATH
#export PATH="/usr/local/opt/php@7.4/bin:$PATH"
#export PATH="/usr/local/opt/php@7.4/sbin:$PATH"
#export PATH="/usr/local/opt/php@8.0/bin:$PATH"
#export PATH="/usr/local/opt/php@8.0/sbin:$PATH"
export PATH="/usr/local/opt/php@8.1/bin:$PATH"
export PATH="/usr/local/opt/php@8.1/sbin:$PATH"
export PATH=/Users/malabyatewari/.composer/vendor/bin/:$PATH
ZSH_THEME="spaceship"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship
SPACESHIP_BATTERY_SHOW=false
# Aliases
alias cw="cd ~/Projects/"
alias gs="git status -s"
alias gcl="git checkout .; git clean -f -d;"
alias pubkey="pbcopy < ~/.ssh/id_rsa.pub"
alias vu="vagrant up"
alias vs="vagrant ssh"
alias vup="vagrant up --provision"
alias l="lando "
alias drush="lando drush"
alias dblt="ddev blt"
alias ddrush="ddev drush"
alias c="composer"
alias ls="lsd"
alias cat="bat"
crd() {
  composer require drupal/$1
}
crmd() {
  composer remove drupal/$1
}
docker-clean() {
  docker system prune -a;
  docker stop $(docker ps -a -q);
  docker rm -f $(docker ps -a -q);
  docker rmi $(docker images -a -q);
  docker volume prune
}
function blt() {
  if [[ ! -z ${AH_SITE_ENVIRONMENT} ]]; then
    PROJECT_ROOT="/var/www/html/${AH_SITE_GROUP}.${AH_SITE_ENVIRONMENT}"
  elif [ "`git rev-parse --show-cdup 2> /dev/null`" != "" ]; then
    PROJECT_ROOT=$(git rev-parse --show-cdup)
  else
    PROJECT_ROOT="."
  fi

  if [ -f "$PROJECT_ROOT/vendor/bin/blt" ]; then
    $PROJECT_ROOT/vendor/bin/blt "$@"

  # Check for local BLT.
  elif [ -f "./vendor/bin/blt" ]; then
    ./vendor/bin/blt "$@"

  else
    echo "You must run this command from within a BLT-generated project."
    return 1
  fi
}

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/Users/malabyatewari'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

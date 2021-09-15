export ZSH="/Users/zhangxu/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git autojump zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi
[[ -s /Users/zhangxu/.autojump/etc/profile.d/autojump.sh ]] && source /Users/zhangxu/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

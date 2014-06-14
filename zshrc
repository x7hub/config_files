# zle has an emacs mode and a vi mode
bindkey -v

# history
HISTFILE=~/.histfile
HISTSIZE=3000
SAVEHIST=3000
setopt EXTENDED_HISTORY

# enable autocompletion
autoload -U compinit
compinit

#Completion Options
#zstyle ':completion:*:match:*' original only
#zstyle ':completion::prefix-1:*' completer _complete
#zstyle ':completion:predict:*' completer _complete
#zstyle ':completion:incremental:*' completer _complete _correct
#zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
#zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Group matches and Describe
#zstyle ':completion:*:matches' group 'yes'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:options' auto-description '%d'
#zstyle ':completion:*:options' description 'yes'
#zstyle ':completion:*:descriptions' format $'%{\e[0;33m%}%B -- %d --%b%{\e[0m%}'
#zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
#typeset -A key
#key[Home]=${terminfo[khome]}
#key[End]=${terminfo[kend]}
#key[Insert]=${terminfo[kich1]}
#key[Delete]=${terminfo[kdch1]}
#key[Up]=${terminfo[kcuu1]}
#key[Down]=${terminfo[kcud1]}
#key[Left]=${terminfo[kcub1]}
#key[Right]=${terminfo[kcuf1]}
#key[PageUp]=${terminfo[kpp]}
#key[PageDown]=${terminfo[knp]}

# setup key accordingly
#[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
#[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
#[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
#[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
#[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
#[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
#[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
#[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Doing this, only past commands beginning with the current input would have been shown. 
#bindkey "^[[A" history-beginning-search-backward
#bindkey "^[[B" history-beginning-search-forward

# oh-my-zsh plugins
ZSH=/usr/share/oh-my-zsh
plugins=(git)
#ZSH_THEME=af-magic
source $ZSH/oh-my-zsh.sh

# set up a colored prompt
#autoload -U promptinit
#promptinit
#autoload -U colors && colors
if [ $UID -eq 0 ]
then #root
PROMPT='%{$fg[yellow]%}%~%{$reset_color%}$(git_prompt_info)%{$fg[red]%} %# %{$reset_color%}'
PROMPT2=''
RPROMPT="%{$FG[237]%}%n@%m %l %T %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]("
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[214]*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
else #els
PROMPT='%{$FG[032]%}%~%{$reset_color%}$(git_prompt_info)%{$FG[105]%} %# %{$reset_color%}'
PROMPT2=''
RPROMPT="%{$FG[237]%}%n@%m %l %T %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]("
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[214]*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
fi


# For autocompletion with an arrow-key driven interface
#zstyle ':completion:*' menu select

# default editor
export EDITOR='vim'

# python startup
export PYTHONSTARTUP=~/.pythonstartup

# alias
alias ls='ls --color=auto'
alias ll='ls -la'

# oh-my-zsh plugins
#ZSH=/usr/share/oh-my-zsh
#plugins=(git)
#ZSH_THEME=af-magic
#source $ZSH/oh-my-zsh.sh

# screenfetch
screenfetch -t

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME="archcraft"
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode enable  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting sudo web-search history ls zsh-interactive-cd docker docker-compose fzf )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# On-demand rehash
zshcache_time="$(date +%s%N)"

autoload -Uz add-zsh-hook

rehash_precmd() {
  if [[ -a /var/cache/zsh/pacman ]]; then
    local paccache_time="$(date -r /var/cache/zsh/pacman +%s%N)"
    if (( zshcache_time < paccache_time )); then
      rehash
      zshcache_time="$paccache_time"
    fi
  fi
}

add-zsh-hook -Uz precmd rehash_precmd

# omz
alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"

# ls
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'
alias neovide='neovide --novsync --frame none'

# git
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'
alias b8u='cd ~/Projects/box-universe/; neovide'
alias prodb8u='cd ~/Projects/box-universe/docker/; sh deploy.sh production'
alias devb8u='cd ~/Projects/box-universe/docker/; sh deploy.sh development'
alias stopb8u='cd ~/Projects/box-universe/docker/; sh deploy.sh stop'

alias _b8u='cd ~/Projects/box-universe'
alias mas='cd ~/Projects/MAS; neovide --multigrid'
alias _mas='cd ~/Projects/MAS'

alias nvimrc='cd ~/.config/bspwm/nvim/; neovide'
alias dotfiles='cd ~/.config/bspwm/; neovide'
alias zshrc='neovide ~/.zshrc'
alias warpConnect='warp-cli connect'
alias warpDisconnect='warp-cli connect'
alias lofi='sh $HOME/.config/bspwm/bin/lofi; exit'
alias stopLofi="ps -ef | grep 'mpv --loop' | grep -v grep | awk '{print $2}' | xargs kill"
alias externalkb='sh $HOME/.config/bspwm/bin/externalKB'
alias internalkb='sh $HOME/.config/bspwm/bin/internalKB'
alias externalM='sh $HOME/.config/bspwm/bin/externalM'
alias internalM='sh $HOME/.config/bspwm/bin/internalM'
alias alacritty='alacritty --config-file ~/.config/bspwm/alacritty/alacritty.yml'
alias emulator="cd ~/Downloads/microemulator-2.0.4; java -jar microemulator.jar &"
alias UPDATE_NVIM_DOTFILES="cp -R ~/.config/nvim ~/.config/bspwm/"
alias kubectl="minikube kubectl --"
alias ls='colorls'
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus
# pidof ibus-daemon > /dev/null || ibus-daemon -drx
export DENO_INSTALL="/home/kidp2h/.deno"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH=$PATH:/home/kidp2h/.spicetify
export KEYBOARD="ITE Tech. Inc. ITE Device(8176) Keyboard"
export TOUCHPAD="MSFT0002:00 04F3:31AD Touchpad"
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
export OPENAI_API_KEY=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
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:/opt/gradle/gradle-7.5.1/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$(ruby -e 'puts File.join(Gem.user_dir, "bin")')
export ZPLUG_HOME=~/.zplug
source ~/.zplug/init.zsh 
zplug "b4b4r07/enhancd", use:init.sh
export VIDEO=$HOME/Videos/wp/1.mp4
eval $(thefuck --alias)
export ENHANCD_FILTER=peco
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
source $(dirname $(gem which colorls))/tab_complete.sh
eval "$(starship init zsh)"

[ -f "/home/kidp2h/.ghcup/env" ] && source "/home/kidp2h/.ghcup/env" # ghcup-env

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="dstufft"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
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
# plugins=(git zsh-nvm zsh-z)
plugins=(git zoxide fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='zed'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Aliases
alias lg="lazygit"
alias ldock="lazydocker"
alias cls="clear"
alias tree="lsd -T"
alias l="lsd -lah"
alias cd="zd"
zd() {
  if [ $# -eq 0 ]; then
    builtin cd ~ && return
  elif [ -d "$1" ]; then
    builtin cd "$1"
  else
    z "$@" && printf "\U000F17A9 " && pwd || echo "Error: Directory not found"
  fi
}

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
# source /usr/share/fzf/shell/key-bindings.zsh
# source /usr/share/fzf/key-bindings.zsh
export FZF_DEFAULT_COMMAND="fd --type f --hidden --no-ignore-vcs --exclude node_modules --exclude .git"
export FZF_CTRL_T_COMMAND="fd --type f --hidden --no-ignore-vcs --exclude node_modules --exclude .git"
export FZF_ALT_C_COMMAND="fd --type d --hidden --no-ignore-vcs --exclude node_modules --exclude .git"

# morhetz/gruvbox
export FZF_DEFAULT_OPTS='--layout=reverse --border --inline-info --color=bg+:-1,bg:-1,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934'

export BAT_THEME="gruvbox-dark"
function v () {
    fzf --preview 'bat --style numbers,changes --color=always {} | head -50' --bind 'enter:become(nvim {+})'
}

function cs () {
    cd "$@" && ls
}

if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# remove ls default zsh highlight color
_ls_colors="ow=34;1:"
LS_COLORS+=$_ls_colors
zstyle ':completion:*:default' list-colors "${(s.:.)_ls_colors}"

export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"

# Auto-switch Node version when entering a directory with .nvmrc
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path="$(nvm_find_nvmrc)"
  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")
    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
eval "$(rbenv init -)"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"


workspace-creation() {
  local slug_arg="$1"
  local context="${2:-us-east-1}"
  local namespace="${3:-shared-01}"
  shift 3

  local label_selector="app.kubernetes.io/name=web-exec"
  
  echo "Switching to context: $context"
  kubectx "$context"

  echo "Looking for pods in namespace: $namespace with label selector: $label_selector"
  local pod_name
  pod_name=$(kubectl get pods -n "$namespace" --no-headers -l "$label_selector" --field-selector status.phase=Running | head -1 | awk '{print $1}')

  if [[ -z "$pod_name" ]]; then
    echo "No running pod found in namespace '$namespace' with label selector '$label_selector'."
    return 1
  fi

  echo "Found pod: $pod_name"
  echo "Running rake task: integrations:bird:create:workspace[${slug_arg}]"
  echo "Namespace: $namespace | Context: $context"

  kubectl exec -it -n "$namespace" "$pod_name" -- env DISABLE_SPRING=true bundle exec rake "integrations:bird:create:workspace[${slug_arg}]" "$@"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/macr/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/macr/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/macr/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/macr/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$HOME/.local/bin:$PATH"

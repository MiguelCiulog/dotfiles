# Zinit stuff
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Add in zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Like oh my zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZP::common-aliases
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::theme-and-appearance.zsh
zinit snippet OMZL::completion.zsh

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# ends zinit stuff

# Completion styling
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
# Dynamic fzf-tab previews: ls for folders, bat for files
zstyle ':fzf-tab:complete:*:*' fzf-preview '
  if [[ -d $realpath ]]; then
    ls --color=always $realpath
  elif [[ -f $realpath ]]; then
    bat --color=always --style=numbers,changes $realpath
  fi
'
# Force fzf-tab to use your custom FZF colors and layouts
zstyle ':fzf-tab:*' fzf-flags \
  --color=bg+:-1,bg:-1,spinner:#fb4934,hl:#928374,fg:#ebdbb2,header:#928374,info:#8ec07c,pointer:#fb4934,marker:#fb4934,fg+:#ebdbb2,prompt:#fb4934,hl+:#fb4934 \
  --layout=reverse --border --inline-info

# Aliases
alias ls='ls --color'
alias c='clear'
alias lg="lazygit"
alias ldock="lazydocker"
export BAT_THEME="gruvbox-dark"

function v () {
    fzf --preview 'bat --style numbers,changes --color=always {} | head -50' --bind 'enter:become(nvim {+})'
}

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

export EDITOR=nvim

# should be last btw
zinit light zsh-users/zsh-syntax-highlighting

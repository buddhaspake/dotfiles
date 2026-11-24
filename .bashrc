# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

# Add git branch to prompt
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'
PS1='\[\e[38;5;74m\]\w \[\e[0m\][${PS1_CMD1}]\\$ '
# Custom scripts
scripts_path=~/stuff/code/bash/myscripts.sh
if [ -f $scripts_path ]; then
  source $scripts_path
  echo "${scripts_path} loaded."
else
  echo "No custom scripts found.."
fi

# FZF Config
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Default editor
export EDITOR=nvim
export VISUAL=nvim

# Config for Android Studio
# Added by SB on 2025/12/13
export PATH=$PATH:$HOME/Downloads/SW/AndroidStudio/android-studio/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/36.1.0

# Config for Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

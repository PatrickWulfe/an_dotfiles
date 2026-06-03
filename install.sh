#!/bin/bash
set -e

# Bootstrap script for dotfiles
# Usage: clone the repo, then run ./install.sh

echo "==> Installing dotfiles"

# Install Homebrew if missing
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Install chezmoi if missing
if ! command -v chezmoi &>/dev/null; then
  echo "==> Installing chezmoi..."
  brew install chezmoi
fi

# Install core tools
echo "==> Installing core dependencies..."
brew install --quiet \
  antigen \
  starship \
  zsh-you-should-use \
  trash

# Initialize chezmoi with this repo as source
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
chezmoi init --source="$SCRIPT_DIR"

# Apply dotfiles
echo "==> Applying dotfiles..."
chezmoi apply

echo "==> Done! Restart your shell or run: exec zsh"
echo ""
echo "NOTE: Create ~/.config/secrets.env with your tokens (not tracked by chezmoi)."

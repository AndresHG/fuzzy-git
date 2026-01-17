# Fuzzy Git

Git aliases powered by [fzf](https://github.com/junegunn/fzf) for interactive git workflows.

## Prerequisites

- Git
- [fzf](https://github.com/junegunn/fzf) - command-line fuzzy finder

## Installation

### 1. Install fzf

**macOS:**
```bash
brew install fzf
```

**Linux:**
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

**Or via package manager:**
```bash
sudo apt install fzf
sudo pacman -S fzf
```

### 2. Setup on New Computer

**Clone the repository:**
```bash
git clone <this-repo-url> ~/fuzzy-git
cd ~/fuzzy-git
```

**Copy the files for the setup:**
```bash
mkdir -p ~/.git-scripts
cp .git-scripts/* ~/.git-scripts/
chmod +x ~/.git-scripts/*.sh
cat .gitconfig >> ~/.gitconfig
```

## Available Aliases

| Alias | Description |
|-------|-------------|
| `git fixup` | Select commit from last 50 to fixup |
| `git cof` | Checkout branch with fuzzy search |
| `git cb` | Checkout branch with preview (date, subject) |
| `git af` | Add multiple files interactively |
| `git afmend` | Add files and amend commit |
| `git resetm` | Reset staged files with preview |
| `git fgc` | Interactive commit browser with actions |

### git fgc - Interactive Commit Browser

**Keybindings:**
- `ENTER` - View diff in less
- `CTRL-S` - Toggle between branch/all commits
- `ALT-C` - Checkout commit
- `ALT-R` - Reset to commit
- `ALT-I` - Interactive rebase
- `ALT-P` - Cherry-pick (all commits mode)
- `F1` - Toggle header
- `F2` - Toggle preview

## Usage Examples

```bash
git af
git cb
git fgc
git fixup
```

## Additional Aliases

See `additional-aliases.sh` for more fuzzy git commands.

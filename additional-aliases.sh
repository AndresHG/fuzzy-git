#!/usr/bin/env bash

cat << 'EOF'
Additional Fuzzy Git Aliases
============================
Add these to your .gitconfig under [alias] section

# Interactive stash browser with preview and actions
stash = "!f() { \
  git stash list | \
  fzf --preview 'git stash show -p {1}' \
      --bind 'enter:execute(git stash show -p {1} | less)' \
      --bind 'ctrl-a:execute(git stash apply {1})+abort' \
      --bind 'ctrl-p:execute(git stash pop {1})+abort' \
      --bind 'ctrl-d:execute(git stash drop {1})+abort' \
      --header 'ENTER=show | CTRL-A=apply | CTRL-P=pop | CTRL-D=drop'; \
}; f"

# Search through git log by commit message or diff content
search = "!f() { \
  git log --color --pretty=format:'%C(yellow)%h%Creset %s %C(cyan)%an%Creset %C(green)%cr%Creset' \
    --all -G\"$1\" | \
  fzf --ansi --preview \"git show --color {1}\" \
      --bind 'enter:execute(git show {1} | less -R)'; \
}; f"

# Interactive file history browser - see all commits that modified a file
fh = "!f() { \
  git log --color --pretty=format:'%C(yellow)%h%Creset %C(green)%cs%Creset %s' \
    --follow -- \"$1\" | \
  fzf --ansi --preview \"git show --color {1} -- $1\" \
      --bind 'enter:execute(git show {1} -- $1 | less -R)' \
      --bind 'ctrl-d:execute(git diff {1}^ {1} -- $1 | less -R)'; \
}; f"

# Interactive diff viewer for modified files
df = "!f() { \
  git diff --name-only \"$@\" | \
  fzf --preview \"git diff --color $@ -- {}\" \
      --bind 'enter:execute(git diff --color $@ -- {} | less -R)'; \
}; f"

# Interactive tag browser with commit preview
tags = "!f() { \
  git tag -l | \
  fzf --preview 'git show --color {}' \
      --bind 'enter:execute(git show {} | less -R)' \
      --bind 'ctrl-c:execute(git checkout {})+abort' \
      --header 'ENTER=show | CTRL-C=checkout'; \
}; f"

EOF

echo ""
echo "To add these aliases, run:"
echo "  cat additional-aliases.sh | grep -A 100 'cat << ' | tail -n +2 | head -n -2 >> ~/.gitconfig"
echo ""
echo "Or manually copy the aliases from this file to your ~/.gitconfig"

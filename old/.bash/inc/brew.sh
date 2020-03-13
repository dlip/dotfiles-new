brew_install() {
    if [ "$(uname)" = "Darwin" ]; then
        if ! which brew &> /dev/null; then
            run 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
        fi
        if ! brew bundle check --no-upgrade --file="$DOTFILES_DIR/Brewfile" &> /dev/null; then
            run "brew bundle --verbose --no-upgrade --file='$DOTFILES_DIR/Brewfile'"
        fi
    fi
    
}

brew_cleanup() {
    run "brew bundle cleanup --force --file='$DOTFILES_DIR/Brewfile'"
}

brew_save() {
    # Generate the current Brewfile in a temporary location to diff
    run "rm -f '/tmp/Brewfile'"
    run "brew bundle dump --force --file='$DOTFILES_DIR/Brewfile'"
}

brew_update() {
    run "brew upgrade"
}

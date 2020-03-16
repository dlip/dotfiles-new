gitconfig_install() {
    if [ ! -f "$DOTFILES_DIR/.local.gitconfig" ]; then
        run "gitconfig_create"
    fi
}

gitconfig_create() {
    echo -n 'Enter Git full name: '
    read GIT_USER
    echo -n 'Enter Git email: '
    read GIT_EMAIL
    cat > .local.gitconfig <<EOF
[user]
    name = $GIT_USER
    email = $GIT_EMAIL
EOF
}
plist_install() {
    if [ "$(uname)" = "Darwin" ]; then
        for FILE in $DOTFILES_DIR/plist/*; do
            OUT_FILE=/Library/Preferences/$(basename $FILE)
            if [ ! -f "$OUT_FILE" ]; then
                run "sudo plutil -convert binary1 -o '$OUT_FILE' '$FILE'"
            fi
        done
    fi
}
remove_path_duplicates() {
    local OLD_PATH="$PATH"
    local NEW_PATH=""
    local IFS=':'
    for DIR in $OLD_PATH; do
        if [[ ! "$NEW_PATH" =~ (^|:)"$DIR"(:|$) ]]; then
            NEW_PATH="$NEW_PATH:$DIR"
        fi
    done
    PATH="${NEW_PATH:1}"  # Remove leading colon
}

remove_path_duplicates


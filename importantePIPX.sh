# Da Reddit: https://www.reddit.com/r/qtile/comments/18s4109/pipx_qtile_injected_packages_import_error/


pipx inject qtile dbus-next psutil pyxdg
pipx inject iwlib dbus-next psutil pyxdg
pipx ensurepath
sudo ln -sf ~/.local/bin/qtile /usr/local/bin/


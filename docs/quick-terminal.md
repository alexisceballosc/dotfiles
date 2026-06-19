# Quick terminal: Hammerspoon replacement for Ghostty's native one

Ghostty's native quick terminal is a non-activating panel. Input Source Pro
can't detect it, so it never switches the input language. As a workaround,
Hammerspoon (`hammerspoon/.hammerspoon/quick_terminal.lua`) toggles a regular
Ghostty window instead — a real window that Input Source Pro sees as a
focused app.

## Switching back to the native quick terminal

If Input Source Pro ever detects the native panel (check Ghostty release
notes), revert with:

1. Uncomment the commented-out `quick-terminal-*` settings block (and the
   `global:cmd+grave_accent` keybind) in `ghostty/.config/ghostty/config`.
2. Remove `window-decoration = none`.
3. Delete `hammerspoon/.hammerspoon/quick_terminal.lua` and its `require`
   in `hammerspoon/.hammerspoon/init.lua`.
4. Restow (`stow -R ghostty hammerspoon`), restart Ghostty and Hammerspoon.

# Quick terminal

## Current setup

Ghostty's native quick terminal is active
(`ghostty/.config/ghostty/config`: `keybind = global:cmd+grave_accent=toggle_quick_terminal`
and the `quick-terminal-*` settings).

`window-decoration = none` was removed from the config: it was only there to
make the Hammerspoon-managed window look borderless, not needed for the
native panel.

## Why it works with Input Source Pro

The native quick terminal is a non-activating panel: it never triggers the
app-activation signal Input Source Pro normally relies on to detect focus
and switch input source. Fixed with a small fork of ISP:

- Fork: https://github.com/alexisceballosc/InputSourcePro
- Release (prebuilt, ad-hoc signed): tag `2.11.0-ghostty`
- Patch: adds `com.mitchellh.ghostty` to Enhanced Mode's floating-app
  allowlist in `NSApplication.swift`, the same list iTerm2's hotkey window
  is already on. Requires Enhanced Mode on in ISP's preferences.

This fork won't get upstream updates automatically. When upstream ISP
releases something you want, re-apply the one-line patch and rebuild (or
check if Ghostty got added upstream and drop the fork entirely).

## Why Hammerspoon was used before this fix existed

Before finding the ISP fix above, the native panel's non-activating
behavior looked unfixable, so the quick terminal ran as a regular Ghostty
window managed by Hammerspoon instead: a real, activating window, which
stock (unpatched) Input Source Pro already handles fine since it's not a
non-activating panel.

## How the Hammerspoon version worked

`cmd+\`` was bound in Hammerspoon (not Ghostty) to toggle Ghostty:

- If Ghostty wasn't running, launch it and wait for its main window.
- If running with no window, open one (`File > New Window`).
- If its window was visible, `app:hide()`. Otherwise, show it: move it to
  the focused space and the screen under the mouse, resize/reposition it
  to a bottom-centered rect that scales between ~55%/80% width/height on
  small screens and a fixed 2.5%-padding inset on large ones, then
  `app:activate()` and turn on Ghostty's own "Window > Float on Top".

This is a validated, working option if the ISP fork ever breaks (upstream
update wipes the patch, permission issues, etc.) and you want input-source
switching back without waiting to re-patch and rebuild. To bring it back:

1. In `ghostty/.config/ghostty/config`, comment out the `quick-terminal-*`
   settings and the `global:cmd+grave_accent` keybind, add back
   `window-decoration = none`.
2. Recreate `hammerspoon/.hammerspoon/quick_terminal.lua` from the
   description above (or from git history: `git log --all --full-history -- hammerspoon/.hammerspoon/quick_terminal.lua`),
   and `require("quick_terminal")` in `init.lua`.
3. Restow (`stow -R ghostty hammerspoon`), restart Ghostty and Hammerspoon.

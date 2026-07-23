# Core
set -g fish_greeting
fish_add_path /opt/homebrew/bin /opt/homebrew/sbin ~/.local/bin

# Tools
starship init fish | source
zoxide init fish | source
atuin init fish | source
if not set -q FNM_DIR
    fnm env --use-on-cd | source
end

# Environment
set -gx EDITOR micro


# Behavior
function fish_postexec --on-event fish_postexec
    switch $argv[1]
        case clear reset "clear *"
            return
    end
    echo
end

# pnpm
function pnpm
    fnm exec --using=default -- /opt/homebrew/bin/pnpm $argv
end

# eza
set -gx EZA_COLORS "di=37:fi=31:ex=31:ln=36:or=2;4;31:pi=90:so=90:bd=90:cd=90:hd=1;37:sn=36:sb=90:da=90:xx=90:uu=37:un=90:gu=90:gn=90:ga=37:gm=91:gd=2;31:lc=90:sc=31:do=31:bu=31:im=90:vi=90:mu=90:lo=90:co=90:tm=90:cm=90:cr=90"
alias ls  "eza --group-directories-first"
alias ll  "eza -l --group-directories-first --git"
alias la  "eza -la --group-directories-first --git"
alias lt  "eza --tree --level=4 -I node_modules --no-symlinks"

# fzf
set -gx FZF_DEFAULT_OPTS "\
  --color=fg:#F75049,fg+:#090909,bg:-1,bg+:#F75049 \
  --color=hl:#F75049,hl+:#090909 \
  --color=border:#6b6b6b,label:#6b6b6b \
  --color=prompt:#F75049,pointer:#F75049,marker:#F75049 \
  --color=spinner:#F75049,info:#6b6b6b,header:#6b6b6b"
set -gx _ZO_FZF_OPTS "--style full --preview 'eza --color=always --group-directories-first {-1}' --preview-window=right:40%"


# Colors
set -U fish_color_normal red
set -U fish_color_command red --bold
set -U fish_color_param red
set -U fish_color_option brblack
set -U fish_color_quote white
set -U fish_color_valid_path white
set -U fish_color_redirection white # Echos to text like smthng > output.txt
set -U fish_color_operator brwhite # Operators as < and > normally
set -U fish_color_keyword white # Keywords as if, else, etc.
set -U fish_color_comment brblack
set -U fish_color_end brblack # End of commands as ; and &
set -U fish_color_selection white # Selections on v mode
set -U fish_color_escape brblack # escape sequences as \t \n
set -U fish_color_autosuggestion brblack
set -U fish_color_cancel brblack # Cancel indicators as ctrl + c
set -U fish_color_error red --dim --underline

set -U fish_color_search_match brblack # Overwritted by atuin
set -U fish_color_history_current green # Overwritted by atuin
set -U fish_color_cwd green # Overwritted by starship
set -U fish_color_cwd_root green # Overwritted by starship
set -U fish_color_user green # Overwritted by starship
set -U fish_color_host green # Overwritted by starship
set -U fish_color_host_remote green # Overwritted by starship
set -U fish_color_status green # Overwritted by starship

# Pager
set -U fish_pager_color_progress red
set -U fish_pager_color_background green # idk
set -U fish_pager_color_selected_background green # idk
set -U fish_pager_color_secondary_background green # idk
set -U fish_pager_color_prefix red
set -U fish_pager_color_secondary_prefix red
set -U fish_pager_color_selected_prefix red
set -U fish_pager_color_completion brblack
set -U fish_pager_color_secondary_completion brblack
set -U fish_pager_color_selected_completion red
set -U fish_pager_color_description red
set -U fish_pager_color_secondary_description red
set -U fish_pager_color_selected_description white
source $HOME/.config/op/plugins.sh

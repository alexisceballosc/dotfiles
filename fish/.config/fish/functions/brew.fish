function brew
    command brew $argv
    switch $argv[1]
        case install uninstall remove tap untap upgrade pin unpin
            command brew bundle dump --file=~/.config/Brewfile --force
    end
end

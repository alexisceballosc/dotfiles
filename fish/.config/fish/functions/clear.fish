function clear
    if contains -- --hard $argv
        printf '\033[2J\033[3J\033[H'
    else
        command clear
    end
end

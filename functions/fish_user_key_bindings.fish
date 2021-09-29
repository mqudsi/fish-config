function fish_user_key_bindings
    if functions -q fzf_key_bindings
        fzf_key_bindings
    end

    # bind alt+bkspc to kill words
    # Note: macOS doesn't support distinct alt+bkspc
    bind \e\x7F backward-kill-word
    # bind alt+del to kill words
    # Note: macOS doesn't support distinct alt+del
    bind \e\[3\;3~ kill-word
    # bind ctrl+del to kill big words
    bind \e\[3\;5~ kill-bigword

    # ctrl+home/end for beginning/end of commandline
    bind \e\[1\;5H beginning-of-buffer
    bind \e\[1\;5F end-of-buffer
    # bind alt+f4 to exit
    bind \e\[1\;3S exit

    # repeat the last argument in the current command, e.g. useful for doing
    # cp /long/path/to/a/file /long/path/to/a/file.bak
    bind \er repeat_last_argument
end

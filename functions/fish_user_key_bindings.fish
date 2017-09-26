function fish_user_key_bindings
    fzf_key_bindings

    bind \ev 'edit_cmd; commandline -f execute'
    #bind alt+del/bkspc to kill words
    bind \e\e\[3~ kill-word
    bind \e\cH backward-kill-word
    #ctrl+home/end for beginning/end of commandline
    bind [1\;5H beginning-of-buffer
    bind [1\;5F end-of-buffer
end

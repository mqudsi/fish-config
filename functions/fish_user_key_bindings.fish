function fish_user_key_bindings
    fzf_key_bindings

    bind \ev 'edit_cmd; commandline -f execute'
    #bind alt+del/bkspc to kill words
    bind \e\e\[3~ kill-word
    bind \e\cH backward-kill-word
    #bind alt+f4 to exit
    bind [1\;3S exit
end

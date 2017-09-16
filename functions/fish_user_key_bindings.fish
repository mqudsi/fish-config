function fish_user_key_bindings
    fzf_key_bindings

    #bind alt+del/bkspc to kill words
    bind \e\[3~ kill-word
    bind \e\cH backward-kill-word
end

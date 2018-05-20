begin
	set --local AUTOJUMP_PATH $HOME/.autojump/share/autojump/autojump.fish
	if test -e $AUTOJUMP_PATH
		source $AUTOJUMP_PATH
	end
end

if type -q fd
	# set FZF_CTRL_T_COMMAND "rg --files --no-ignore --hidden --follow -g '!{.git,node_modules}/*'"
	# set FZF_CTRL_T_COMMAND "fd -t f -E '*.{o,swp,tlog,tmp}' -E '^~' -E '{.git,node_modules}' --ignore-file .ignore"
	# set FZF_CTRL_T_COMMAND "fd -t f -E '*.{o,swp,tlog,tmp}' -E '^~' -E '{.git,node_modules}'"
	# These commands are eval'd, so if we escape $dir it will be replaced with the new value
	set FZF_CTRL_T_COMMAND "fd -t d -t f -t l '^' \$dir --follow --color=always"
	set FZF_ALT_C_COMMAND "fd -t d '^' \$dir --follow --color=always"
	set FZF_DEFAULT_OPTS "--ansi" # to support `fd --color`
end

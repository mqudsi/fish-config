if not status --is-interactive
	exit
end

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

# disable colored background for ls output to make it look OK in dark terminals
set -x LS_COLORS 'tw=*;41:ow=*;42:'

# work around slow ^C, making sure to close pager
# https://github.com/fish-shell/fish-shell/issues/5259
# https://github.com/fish-shell/fish-shell/commit/c02bf2548f6e4cc6283a6716006705c6353bd41d
bind \cc 'commandline -f cancel; commandline ""'

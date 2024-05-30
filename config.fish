if not status --is-interactive
	exit
end

# Abuse __fish_cache_sourced_completions to speed up zoxide init
__fish_cache_sourced_completions zoxide init fish; and alias j z

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
# Set flags used by BSD ls to determine if colors are shown at the tty (since we are in active mode)
set -x COLORTERM
set -x CLICOLOR

# Work around slow ^C, making sure to close pager
# https://github.com/fish-shell/fish-shell/issues/5259
# https://github.com/fish-shell/fish-shell/commit/c02bf2548f6e4cc6283a6716006705c6353bd41d
bind \cc 'commandline -f cancel; commandline ""'

# Map ctrl-n to launch a new terminal window; useful for terminals that don't
# do so by default. This should work anywhere `open` exists.
if type -q open
	bind \cN 'open fish'
end

# Stop posting junk to the terminal when INS is pressed
bind -k ic true

if type -q git.exe
	function git.exe --wraps git
		command git.exe $argv
	end
end

set -g MOVFLAGS -movflags +write_colr+use_metadata_tags+frag_keyframe+empty_moov+default_base_moof+faststart -frag_duration 1000000

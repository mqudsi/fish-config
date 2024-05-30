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

# Stop posting junk to the terminal when INS is pressed
bind -k ic true

set -g MOVFLAGS -movflags +write_colr+use_metadata_tags+frag_keyframe+empty_moov+default_base_moof+faststart -frag_duration 1000000

abbr sudo 'sudo -E'
# For some reason on my Model M keyboard I find myself often typing `gitp ull` instead of `git pull`
abbr --add gitp --set-cursor='!' 'git p!'

if string match -qei microsoft <?/proc/version
	# Map ctrl-n to launch a new terminal window; useful for terminals that don't
	# do so by default. This should work anywhere `open` exists.
	type -q open; and bind \cN 'open fish'

	function __wsl_drive
		function __mount_wsl_drive
			set letter (string match -r '^[A-Za-z]' -- $argv[1] | string lower)
			or echo "Invalid drive parameter!" && return -1

			if mount | string match -irq $letter:
				echo "Already mounted!"
				return 0
			end

			set path /mnt/$letter
			sudo -E mkdir -p $path
			set drive (printf '%c:'\\ (string upper -- $letter))
			sudo -E mount -t drvfs -o metadata,rw,noatime,uid=1000,gid=1000,umask=22,fmask=11,metadata,case=dir $drive $path
		end

		set letter (string match -r '^[A-Za-z]' -- $argv[1] | string lower)
		__mount_wsl_drive $letter 2>/dev/null 1>/dev/null
		and cd /mnt/$letter
	end

	abbr -a wsl_drive --position command --regex '^[a-zA-Z]:$' --function __wsl_drive
end

function man
	if not command man -w $argv >/dev/null 2>/dev/null
		echo "man page not found!" >&2
		return 1
	
	if type -q nvim
		nvim -u NORC -c ":set fileignorecase" -c ":Man $argv" -c ":silent :only" \
			-c 'nunmap <buffer> q' -c 'nmap q :q!<CR>' -c 'nmap <space> <PageDown>'
	else
		eval (which man) $argv
	end
end


function man --description "an nvim wrapper for man"
	set arg $argv[1..-1]
	if not command man -w $arg >/dev/null 2>/dev/null
		echo "No man page is available for '$arg'" 1>&2
		return 1
	end

	if type -q nvim
		nvim -u NORC -c ":set fileignorecase" -c ":Man $arg" -c ":silent :only" \
			-c ':set mouse=a' \
			-c 'nunmap <buffer> q' -c 'nmap q :q!<CR>' -c 'nmap <space> <PageDown>' \
			-c ':call feedkeys("gg")'
	else
		command man $arg
	end
end


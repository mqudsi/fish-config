function man
	set arg $argv[0..-1]
	if which nvim >/dev/null
		# nvim --cmd 'let no_plugin_maps = 1' -c 'runtime! macros/less.vim' -c ":Man $arg" -c ":silent :only"
		nvim -u NORC -c ":set fileignorecase" -c ":Man $argv" -c ":silent :only" \
			-c 'nunmap <buffer> q' -c 'nmap q :q!<CR>' -c 'nmap <space> <PageDown>'
	else
		eval (which man) $arg
	end
end


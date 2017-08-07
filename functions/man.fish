function man
	set arg $argv[0..-1]
	if which nvim >/dev/null
		nvim --cmd 'let no_plugin_maps = 1' -c 'runtime! macros/less.vim' -c ":Man $arg" -c ":only"
	else
		eval (which man) $arg
	end
end


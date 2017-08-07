function man
	set arg $argv[0..-1]
	nvim --cmd 'let no_plugin_maps = 1' -c 'runtime! macros/less.vim' -c ":Man $arg" -c ":only"
end


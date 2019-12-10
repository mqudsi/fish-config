function man --description "an nvim wrapper for man"
	set arg $argv[1..-1]
	if not command man -w $arg >/dev/null 2>/dev/null
		echo "No man page is available for '$arg'" 1>&2
		return 1
	end

	if type -q nvim
		nvim -u NORC -c ":set fileignorecase
			:Man $arg" -c ":silent :only" \
			-c ':nunmap <buffer> q
			:nmap q :q!<CR>
			:nmap <space> <PageDown>' \
			# use `q` to exit like in `less`
			#-c ':<silent> nunmap <buffer> q
			-c ':nmap q :q!<CR>' \
			# # map `space` to `PageDown`
			-c 'nmap <space> <PageDown>' \
			# # use up/down keys to navigate even soft-wrapped lines
			-c 'nnoremap <Up> g<Up>
			:nnoremap <Down> g<Down>
			:nnoremap <silent> <Home> g<Home>
			:nnoremap <silent> <End> g<End>
			:inoremap <silent> <Home> <c-o>g<Home>
			:inoremap <silent> <End> <c-o>g<End>' \
			# # for some reason, it starts scrolled to the bottom so scroll to top
			-c ':call feedkeys("gg")
			set mouse=a'
	else
		command man $arg
	end
end


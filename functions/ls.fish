function ls --description 'alias ls=exa'
	if which exa 2>&1 >/dev/null
		#exa does not support the same parameters as ls, unfortunately
		#see https://github.com/ogham/exa/issues/284
		if echo $argv[1] | egrep "^-[^-]" > /dev/null
			# for i in (seq 1 (count $argv)); echo argv[$i]: $argv[$i]; end;
			set newarg (echo $argv[1] | sed -E "s/^-([^tr \t-]*)[tr]+([a-z]*)/-\1\2s/")
			if test 0 -eq $status
				# echo newarg: $newarg
				set newargs $newarg "modified" $argv[2..-1]
				# for i in (seq 1 (count $newargs)); echo newargs[$i]: $newargs[$i]; end;
				set argv $newargs
			end
			set -g argv $argv
		end
		exa $argv
	else
		eval (which ls) $argv
	end
end

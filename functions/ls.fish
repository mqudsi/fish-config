# Defined in - @ line 0
function ls --description 'alias ls=exa'
	if which exa 2>&1 >/dev/null
		exa $argv
	else
		eval (which ls) $argv
	end
end

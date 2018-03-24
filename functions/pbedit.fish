function pbedit
	set -l pbtemp mktemp
pbpaste > mktemp
nvim $pbtemp
and cat $pbtemp | pbcopy
end

function pbedit
	set -lx TMPDIR $HOME/.tmp
	mkdir -p $TMPDIR
	set -l pbtemp (mktemp)
	pbpaste $pbtemp
	nvim $pbtemp
	and cat $pbtemp | pbcopy
	and rm $pbtemp # only if we succeeded above
end

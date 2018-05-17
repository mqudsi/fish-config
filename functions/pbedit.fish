function pbedit
	set -lx TMPDIR $HOME/.tmp
	mkdir -p $TMPDIR
	set -l pbtemp (mktemp)
	pbpaste $pbtemp
	# Create a backup of the old pasteboard contents
	cp $pbtemp $TMPDIR/.prevpb
	nvim $pbtemp
	and cat $pbtemp | pbcopy
	and rm $pbtemp # only if we succeeded above
end

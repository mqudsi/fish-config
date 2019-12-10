function nuget
	# This isn't needed, just run `nuget config -Set defaultPushSource https://nuget.org/`
	# if echo $argv | egrep "\bpush\b" >/dev/null
	# 	set argv $argv -source https://nuget.org/
	# end
	nuget.exe $argv
end

function nuget 
	if echo $argv | egrep "\bpush\b" >/dev/null
		set argv $argv -source https://nuget.org/
	end
	nuget.exe $argv
end

function pbcopy
	set -l uname (uname -a)
	if echo $uname | string match -qr -- "Microsoft"
		clip.exe <&0 2>/dev/null
	else if echo $uname | string match -qr -- "Darwin"
		command pbcopy <&0 2>/dev/null
	end
end

function pbpaste
	set -l uname (uname -a)
	if echo $uname | string match -qr -- "Microsoft"
		paste.exe <&0 2>/dev/null
	else if echo $uname | string match -qr -- "Darwin"
		command pbpaste <&0 2>/dev/null
	end
end

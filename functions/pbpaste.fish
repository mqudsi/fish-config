function pbpaste
	#lemonade does not understand IPv6!
	if type -q lemonade; and string length -q $SSH_CLIENT; and not string match -rq ':' $SSH_CLIENT
		set -l host (echo $SSH_CLIENT | cut -f1 -d ' ')
		lemonade --host $host paste 2>/dev/null
		return
	end
	set -l uname (uname -a)
	if echo $uname | string match -qr -- "Microsoft"
		paste.exe <&0 2>/dev/null
	else if echo $uname | string match -qr -- "Darwin"
		command pbpaste <&0 2>/dev/null
	end
end

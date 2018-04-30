function pbcopy
	if test (count $argv) -eq 2
		cat $argv[2] | pbcopy
		return $status
	end
	#lemonade does not understand IPv6!
	if type -q lemonade; and string length -q $SSH_CLIENT; and not string match -rq ':' $SSH_CLIENT
		set -l host (echo $SSH_CLIENT | cut -f1 -d ' ')
		lemonade --host $host copy 2>/dev/null
		return
	end
	set -l uname (uname -a)
	if echo $uname | string match -qr -- "Microsoft"
		clip.exe <&0 2>/dev/null
	else if echo $uname | string match -qr -- "Darwin"
		command pbcopy <&0 2>/dev/null
	end
end

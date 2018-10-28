function pbpaste
	#pbpaste FILE can be used to paste to a file
	if set -q argv[1]
		pbpaste > $argv[1]
		return $status
	end

	# In case of remote hosts
	# lemonade does not understand IPv6!
	if type -q lemonade; and string length -q $SSH_CLIENT; and not string match -rq ':' $SSH_CLIENT
		set -l host (echo $SSH_CLIENT | cut -f1 -d ' ')
		lemonade --host $host paste 2>/dev/null | read -lz text
		if type -q dos2unix
			echo $text | dos2unix
		else
			echo $text
		end
		return
	end

	set -l uname (uname -a)
	if echo $uname | string match -qr -- "Microsoft"
		paste.exe <&0 2>/dev/null
	else if echo $uname | string match -qr -- "Darwin"
		command pbpaste <&0 2>/dev/null
	end
end

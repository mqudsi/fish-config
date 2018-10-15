function pbcopy
	#pbcopy FILE can be used to copy contents of a file
	if set -q argv[1]
		cat $argv[1] | pbcopy
		return $status
	end

	read -zl contents

	#lemonade does not understand IPv6!
	if type -q lemonade; and string length -q $SSH_CLIENT; and not string match -rq ':' $SSH_CLIENT
		set -l host (echo $SSH_CLIENT | cut -f1 -d ' ')
		printf $contents | lemonade --host $host copy 2>/dev/null
		return
	end
	set -l uname (uname -a)
	if echo $uname | string match -qr -- "Microsoft"
		printf $contents | clip.exe 2>/dev/null
	else if echo $uname | string match -qr -- "Darwin"
		printf $contents | command pbcopy 2>/dev/null
	end
end

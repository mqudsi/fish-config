if not set -q __uname_a
	set -g __uname_a (uname -a)
end

function pbcopy
	# `pbcopy FILE` can be used to copy contents of a file
	if set -q argv[1]
		cat $argv[1] | pbcopy
		return $status
	end

	# `lemonade` does not understand IPv6!
	if type -q lemonade; and string length -q $SSH_CLIENT; and not string match -rq ':' $SSH_CLIENT
		set -l host (echo $SSH_CLIENT | cut -f1 -d ' ')
		lemonade --host $host copy 2>/dev/null
	else if echo $__uname_a | string match -qr -- "Microsoft"
		clip.exe <&0 2>/dev/null
	else if echo $__uname_a | string match -qr -- "Darwin"
		command pbcopy <&0 2>/dev/null
	else if type -q xclip
		xclip -selection clipboard -i <&0
	end
end

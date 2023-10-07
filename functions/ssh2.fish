function ssh2
	if ! string match -qr "^(?P<user>.*)@(?P<host>.*)" $argv[-1]
		echo "Error matching username and host!" >&2;
		return 1
	end
	if ! set host (dig @192.168.45.1 +short $host)
		echo "Error looking up ip of $host" >&2
		return 1
	end

	ssh $argv[..-2] $user@$host
end

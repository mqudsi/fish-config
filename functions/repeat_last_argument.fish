function repeat_last_argument
	set -l last (commandline -o)[-1]
	commandline -a $last
	commandline -C (string length (commandline))
end

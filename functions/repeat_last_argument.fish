function repeat_last_argument
	set -l last (string escape -- (commandline -co)[-1])
	commandline -a $last
	commandline -C (string length (commandline))
end

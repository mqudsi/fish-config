function open_rand
	set -l file
	# printf "* `%s`\n" $argv
	# echo fd -t f (string escape -- $argv) | shuf -n1 --random-source=/dev/urandom
	# return 1
	set file (fd -t f $argv | shuf -n1 --random-source=/dev/urandom)

	echo $file "("(file_size $file)")"
	set -g last_file $file
	open $file
end

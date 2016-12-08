function dl
	aria2c -x 8 --check-certificate=false --file-allocation=none $argv
end
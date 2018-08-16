function dl --wraps aria2c
	aria2c -j8 -x8 --min-split-size=4M --file-allocation=trunc $argv;
end

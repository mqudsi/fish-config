# Defined in - @ line 0
function dl --description 'alias dl aria2c -j8 -x8 --min-split-size=4M --file-allocation=none'
	aria2c -j8 -x8 --min-split-size=4M --file-allocation=none $argv;
end

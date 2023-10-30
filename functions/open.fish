if command -q open
	function open
		for target in $argv
			command open $target
		end
	end
else if command -q open.exe
	function open
		for target in $argv
			command open.exe $target
		end
	end
end

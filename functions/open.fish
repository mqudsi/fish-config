if command -q open.exe
	function open
		for target in $argv
			command open.exe $target
		end
	end
else if command -q xdg-open
	function open
		for target in $argv
			command xdg-open $target
		end
	end
end

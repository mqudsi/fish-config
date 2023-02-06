if not command -q open.exe
	return 1
end

function open
	for target in $argv
		open.exe  $target
	end
end

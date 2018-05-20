functions -e unrar
if test -e "/mnt/c/Program Files/WinRAR/UnRAR.exe"
	function unrar
		"/mnt/c/Program Files/WinRAR/UnRAR.exe" $argv
	end
end

function pbcopy
	uname -a | grep Microsoft >/dev/null
	if test 0 -eq $status
		/mnt/c/Windows/System32/clip.exe <&0 2>/dev/null
	end
end

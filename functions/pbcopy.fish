function pbcopy
	uname -a | grep Microsoft >/dev/null
	if test 0 -eq $status
		clip.exe <&0 2>/dev/null
	end
end

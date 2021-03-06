if uname -a | string match -qr "Microsoft|Ubuntu|Debian"
	function pkg --wraps apt
		apt $argv
	end
else if uname -a | string match -qr "Darwin"
	function pkg --wraps brew
		brew $argv
	end
else
	function pkg
		command pkg $argv
	end
end

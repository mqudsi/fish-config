if uname -a | string match -qr "Microsoft|Ubuntu|Debian"
	complete -c pkg -e
	function pkg --wraps apt
		apt $argv
	end
else if uname -a | string match -qr "Darwin"
	complete -c pkg -e
	function pkg --wraps brew
		brew $argv
	end
else
	function pkg --wraps pkg
		command pkg $argv
	end
end

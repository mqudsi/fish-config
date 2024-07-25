if uname -a | string match -iqr "Microsoft|Ubuntu|Debian"
	function pkg --wraps apt
		apt $argv
	end
else if uname -a | string match -iqr "Darwin"
	function pkg --wraps brew
		brew $argv
	end
else
	function pkg
		command pkg $argv
	end
end

# cache the result of this operation so we don't call
# `uname` each time we execute the function below
set -l flag
if command ls --color=auto /tmp 1>/dev/null 2>/dev/null
	# FreeBSD
	set flag --color=auto
else if command ls -C /tmp 1>/dev/null 2>/dev/null
	# Linux
	set flag -C
else if command ls --color=auto /tmp 1>/dev/null 2>/dev/null
	# macOS
	set flag --color=auto
end

# recent versions of coreutils broke `ls`. Nope, not kidding.
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=886173
if command ls --quoting-style=literal /tmp >/dev/null 2>/dev/null
	set flag $flag --quoting-style=literal
end

function ls --wraps ls --inherit-variable flag
	command ls $flag $argv
end

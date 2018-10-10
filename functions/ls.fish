# cache the result of this operation so we don't call
# `uname` each time we execute the function below
set -l flag
if ls --color=auto /tmp 1>/dev/null 2>/dev/null
	set flag --color=auto
else if ls -G /tmp 1>/dev/null 2>/dev/null
	# macOS and FreeBSD
	set flag -G
end

# recent versions of coreutils broke `ls`. Nope, not kidding.
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=886173
if ls --quoting-style=literal /tmp >/dev/null 2>/dev/null
	set flag $flag --quoting-style=literal
end

function ls --wraps ls --inherit-variable flag
	command ls $flag $argv
end

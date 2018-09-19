# cache the result of this operation so we don't call
# `uname` each time we execute the function below
set -l flag
if uname | string match Darwin >/dev/null
	set flag -G
else
	set flag --color=auto
end

function ls --wraps ls --inherit-variable flag
	command ls $flag $argv
end

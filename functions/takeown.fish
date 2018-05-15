# Defined in - @ line 0
function takeown --description 'alias takeown sudo chown (whoami):(whoami) -R'
	sudo chown -R (whoami):(whoami) $argv;
end

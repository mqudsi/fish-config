# Defined in - @ line 0
function takeown --description 'alias takeown sudo chown (whoami):(whoami) -R'
	sudo chown (whoami):(whoami) -R $argv;
end

function about
	# -F is used to match literally (no regex)
	command rg -z -F $argv (manpath | string split :) -l | command sed -r 's@.*/(.*)\.([0-9]+)(\.gz)?@\1(\2)@g'
end

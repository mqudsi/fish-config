function share
	set -l url https://share.neosmart.net/upload

	if test (count $argv) -eq 0
		http --follow POST $url <&0
	else if test (count $argv) -eq 1
		test -e $argv[1]; or echo "File '$argv[1]' not found!" && return 1
		http --follow POST $url/(basename $argv[1]) @$argv[1]
	else if test (count $argv) -eq 2
		test -e $argv[1]; or echo "File '$argv[1]' not found!" && return 1
		http --follow POST $url/$argv[2] @$argv[1]
	else
		begin
			echo "USAGE:"
			echo -e "\tshare FILE [NAME]"
			echo -e "\t... | share"
		end 1>&2
		return 1
	end
end

function replace_subs
	set src $argv[1]
	set out (mktemp)(path extension $src)
	set use_temp 1
	if set -q $argv[3]
		set out $argv[3]
		set use_temp 0
	end
	set subs $argv[2]
	ffmpeg -i $src -i $subs -map 0:a? -map 0:v? -map 1:s -c:a copy -c:v copy -c:s mov_text $out
	or return -1
	if test $use_temp -eq 1
		mv $out $src
	end
end

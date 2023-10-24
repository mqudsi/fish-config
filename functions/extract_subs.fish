function extract_subs
	set out (path change-extension .srt $argv[1])
	set idx 0
	if string match -q -- $argv[2] "--index"
		set idx $argv[3]
		set argv $argv[1] $argv[4..]
	end
	if set -q argv[2]
		set out $argv[2]
	end
	ffmpeg -i $argv[1] -map 0:s:$idx $out
end

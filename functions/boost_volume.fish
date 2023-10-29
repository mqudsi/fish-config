function boost_volume
	set src $argv[1]
	set boost 10dB
	if string match -riq -- '^\d+db$' $argv[2]
		set boost $argv[2]
		set -e argv[2]
	end
	set out (basename -s (path extension $src) $src)_boost(path extension $src)
	if set -q argv[2]
		set out $argv[2]
		set -e argv[2]
	end

	# set cmd ffmpeg -hide_banner -i $src -af volume=$boost -c:v copy -c:s mov_text -c:a libopus $argv[2..] $out
	set cmd ffmpeg -hide_banner -i $src -map 0:v? -map 0:s? -map 0:a -af volume=$boost -c:v copy -c:s mov_text -c:a libopus $argv[2..] $out
	echo $cmd
	command $cmd
end

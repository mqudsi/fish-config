function extract_audio
	set src $argv[1]
	set extra $argv[2..-2]
	set dest $argv[-1]
	set cmd ffmpeg -hide_banner -i $src -map 0:a:0 $extra $dest
	echo $cmd
	command $cmd
end

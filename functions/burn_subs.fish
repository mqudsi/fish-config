function burn_subs
	set size 0
	if string match -q -- --size $argv[1]
		set size $argv[2]
		set argv $argv[3..]
	end
	set src $argv[1]

	# Set default size based off proportions
	set outline
	string match -rq "(?<width>.*),(?<height>.*)" \
		(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 $src)
	if test $size -eq 0
		if test $width -gt $height
			set size 28
			set outline 4
		else
			set size 14
			set outline 3
		end
	end

	set subs $src
	if string match -irq '\.srt$' $argv[2]
		set subs $argv[2]
		set argv $argv[1] $argv[3..]
	end
	set out (path change-extension "" $src)_subs(path extension $src)
	if set -q argv[2]
		set out $argv[2]
	end
	set cmd ffmpeg -hide_banner -i $src -vf subtitles=$subs:force_style=\'Fontname=Roboto,Fontsize=$size\,Outline=$outline\,MarginV=30\' -c:a copy -sn -c:v h264_nvenc $out
	for word in $cmd
		if ! test "$word" = "-hide_banner"
			printf "%s " (echo $word | string escape)
		end
	end; printf \n
	command $cmd
end

function extract_subs
set out (path change-extension .srt $argv[1])
if set -q argv[2]
set out $argv[2]
end
ffmpeg -i $argv[1] $out
end

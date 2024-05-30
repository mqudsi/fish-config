function open_rand_video --wraps='open_rand . -e mp4 -e avi -e flv -e m4v -e gif -e wmv -e mpeg -e mpg -e webm -e mov -e asf' --wraps='fd . -e mp4 -e avi -e flv -e m4v -e gif -e wmv -e mpeg -e mpg -e webm -e mov -e asf' --description 'opens a random video file from the current directory and its children'
    set ext mp4 avi flv m4v gif wmv mpeg mpg webm mov asf \
        mkv ogv vob 3gp 3g2 mts m2ts ts m2v divx xvid f3v qt swf flc
    if not set -q argv[1]
        set argv[1] .
    end
  open_rand $argv "-e"$ext
end

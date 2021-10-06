# Defined in /tmp/fish.JZEkjW/mv2.fish @ line 2
function mv2
    set -l srcs $argv[1..-2]
    set -l dst $argv[-1]

    if ! test -d $dst
        echo "$dst: destination does not exist or is not a directory!" 1>&2
        return -1
    end

    for src in $srcs
        set dst2 (realpath --relative-to=./ $dst/(basename $src))
		if not test -f $src
			echo "$src: not found"
			continue
		end

        echo mv $src -> $dst2
        if test -f $dst2
            printf "$dst2: already exists - replace it? [y/N]\n"
            read -l response
            if not string match -i y $response or not string match -i yes $response
                continue
            end
        end

        mv $src $dst || return $status
    end

    return 0
end

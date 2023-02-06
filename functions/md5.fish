function md5
    begin
        if set -q argv[1]
            openssl md5 $argv[1]
        else
            openssl md5
        end
    end | string replace -rf '.* ([a-f0-9]+)$' '$1'
end

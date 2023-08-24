function dl --wraps aria2c --description "download with aria2"
	set -l userAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.81 Safari/537.36"
	aria2c --user-agent $userAgent -j8 -x8 --min-split-size=4M --file-allocation=trunc --allow-overwrite=true --auto-file-renaming=false --conditional-get=true $argv;
end

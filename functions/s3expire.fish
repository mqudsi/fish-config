function s3expire --wraps "aws s3 cp"
	set -l bsd 0
	set -l usage
	if date -v +0S >/dev/null 2>/dev/null
		# BSD date
		set bsd 1
		set usage "amt[ymwdHMy]"

		if test (count $argv) -lt 2
			echo "USAGE: s3expire URL $usage" 1>&2
			return 1
		end
	else
		set usage "amt [hour|day|week|month|year][s]"

		if string match -qr "(?<amt>[0-9]+)(?<unit>[hdwmy])" $argv[2]
			set argv[2] $amt
			switch $unit
				case w
					set argv[3] week
				case d
					set argv[3] day
				case h
					set argv[3] hour
				case m
					set argv[3] month
				case y
					set argv[3] year
				case *
					set -e argv[2]
					set -e argv[3]
			end
		end

		if test (count $argv) -lt 3
			echo "USAGE: s3expire URL $usage" 1>&2
			return 1
		end
	end

	set -l url $argv[1]
	# Merge the date portion, converting "1" "week" to "1 week"
	set -l modifier "$argv[2..-1]"
	set -l now (date +%s)
	set -l then
	if test $bsd -eq 0
		set then (date -d $modifier +%s)
	else
		set then (date -v +$modifier +%s)
	end

	set -l expires_in (math $then - $now)
	# echo aws s3 presign --expires-in $expires_in $url
	# set -l result (aws --region us-east-2 s3 presign --expires-in $expires_in $url)
	set -l result (aws s3 presign --expires-in $expires_in $url)
	# Change bucket to a guaranteed valid domain + bucket
	# echo s0: $result
	set result (string replace -r '(com|net|org)\.s3\.amazonaws\.com' '$1' $result)

	# Validate URL, must use GET and not HEAD due to match signed string
	if curl -IXGET $result 2>/dev/null | grep "HTTP/1.1 200 OK" > /dev/null
		echo $result
		return 0
	else
		echo "Invalid URL!" 1>&2
		echo $result 1>&2
		return 1
	end
end

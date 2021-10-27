function pdfconcat --description 'Merge $argv[1..-2] into $argv[-1]'
	if ! set -q argv[3]
		echo "Usage: pdfconcat input1 input2 [input3 ...] output.pdf" 1>&2
		return -1
	end

	# pdftk is a thousand times better than `gs` at this; ghostscript has a tendency to
	# reprocess inputs giving a much larger output than the sum of the inputs. However,
	# pdftk is no longer included in most distro package repos; if you are using this
	# under WSL, your best bet is to install the free binaries and include them in your
	# $PATH.
	set pdftk
	if type -q pdftk
		set pdftk pdftk
	else if type -q pdftk.exe
		set pdftk pdftk.exe
	end

	if set -q pdftk
		command $pdftk $argv[1..-2] cat output $argv[-1]
	else if type -q gs
		gs -sDEVICE=pdfwrite -dColorConversionStrategy=/LeaveColorUnchanged -dDownsampleMonoImages=false -dDownsampleGrayImages=false -dDownsampleColorImages=false -dAutoFilterColorImages=false -dAutoFilterGrayImages=false -dColorImageFilter=/FlateEncode -dGrayImageFilter=/FlateEncode -o $argv[-1] $argv[1..-2]
	else
		echo "No supported PDF engine found! Install `pdftk` (for best results)" \
			"or `gs` (from ghostscript) and try again." 1>&2
		return -1
	end
end

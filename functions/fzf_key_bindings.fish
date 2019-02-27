if not set -qx GOPATH
	set -gx GOPATH ~/go
end

source "$GOPATH/src/github.com/junegunn/fzf/shell/key-bindings.fish"

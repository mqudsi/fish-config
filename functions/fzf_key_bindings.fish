if not set -qx GOPATH
	set -gx GOPATH ~/go
end

if test -f "$GOPATH/src/github.com/junegunn/fzf/shell/key-bindings.fish"
	source "$GOPATH/src/github.com/junegunn/fzf/shell/key-bindings.fish"
end

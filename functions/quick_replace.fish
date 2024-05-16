function quick_replace
set needle $argv[1]
set replace $argv[2]
set search_dirs $argv[3..]

if not string match -qr . -- $needle; or not string match -qr . -- $replace
echo "USAGE: quick_replace NEEDLE REPLACE [file/dir1 file/dir2 ...]" 1>&2
return 1
end

for file in (rg -l $needle $search_dirs)
set old (cat $file)
set new (string replace -ar -- $needle $replace < $file)
diff --color=always -U1 (printf '%s\n' $old | psub) (printf '%s\n' $new | psub)
end | less -R

echo "Continue with replace? [y/N]"
read -l yes
if not string match -irq '^y(es)?$' -- $yes
return 1
end

for file in (rg -l $needle $search_dirs)
string replace -ar -- $needle $replace < $file | rewrite $file
end

end

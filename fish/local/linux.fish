set -gx PATH "/home/abi/go/bin" "/home/abi/sdk/go1.21.0/bin" $PATH


for line in (gnome-keyring-daemon --start 2>/dev/null)
  set item (string split -m 1 '=' $line)
  set -gx $item[1] $item[2]
end

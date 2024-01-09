function posix-source
	for i in (cat $argv)
		set arr (echo $i | sed 's/=/\n/')
  		set -gx $arr[1] $arr[2]
	end
end

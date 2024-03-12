let $u:=name(/*)
let $result:=for $i in //entry
let $k:=$i/keys/text()
let $l:= for $j in tokenize($k,"\|")  return <keys>{normalize-space($j)}</keys>
return <entry>{$l} <values>{$i/values/text()}</values></entry>
return element{$u}{$result}

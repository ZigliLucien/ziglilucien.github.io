for $i in //entry
let $k:=$i/keys/text()
let $l:=<kk>{$k}</kk>
return <entry>{$l} <values>{$i/values/text()}</values></entry>

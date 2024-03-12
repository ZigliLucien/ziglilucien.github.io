for $i in //properties
let $hdr:=$i/headline/text()
let $A:=$i/description/text()
let $B:= <h2>{$hdr}</h2>
return 
<p> {$B}
<div style="font-size:120%">
{$A}
</div>
</p>



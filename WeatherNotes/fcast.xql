<div>

 <h2>Forecast for Jackson County</h2>
{
for $i in //periods/item
let $nm:=$i/name/text()
let $A:=$i/detailedForecast/text()
return <p> 
<div style="font-size:120%">
<h3>
{$nm}
</h3>
{$A}
<br/>
</div>
</p>
}

</div>

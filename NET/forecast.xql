<html>
<head> 
<title> Temperatures Carbondale, IL </title> 
</head>
<body bgcolor='#eeefef'>

<h1 style='font-weight:lighter;color:#ee8844'> Temperatures at a Glance</h1>

<p/><br/><p/>

<h2 style='margin-left:10%'> Highs </h2>
<table border='1' cellspacing='0' cellpadding='0' align='center' width='50%'>
{

for $i in //entry
let $a:=$i/data/HIGHS/text()
let $k:=translate(if(contains($a,'IN THE')) then substring-after($a,'IN THE') else substring-after($a,'HIGHS'),'S','s')
let $kx:=$i/em[../data[contains(.,'HIGHS')]]/text()
return <tr><td  align='center' width='10%' bgcolor='#ffffe0' style='font-size:150%'>{$kx}</td>
<td style='font-family:helvetica;color:#dd8808;font-size:150%' bgcolor='#fffff8' align='center' width='25%'>{$k}</td></tr>
}
</table>

<p/><br/><p/>


<h2 style='margin-left:10%'> Lows </h2>

<table border='1' cellspacing='0' cellpadding='0' align='center' width='50%'>
{
for $i in //entry
let $b:=$i/data/LOWS/text()
let $kk:=translate(if(contains($b,'IN THE')) then substring-after($b,'IN THE') else substring-after($b,'LOWS'),'S','s')
let $ky:=$i/em[../data[contains(.,'LOWS')]]/text()
return <tr><td  align='center' width='10%' bgcolor='#ffffe0' style='font-size:150%'>{$ky}</td>
<td style='font-family:helvetica;color:darkblue;font-size:150%' bgcolor='#ccfff8' align='center' width='25%'>{$kk}</td></tr>

}
 
</table>


</body>
</html>

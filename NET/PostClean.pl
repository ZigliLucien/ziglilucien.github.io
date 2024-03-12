#!/usr/bin/perl

$^I="";

while(<>) {

  if (/<\/head/) { 
print '
<script type="text/javascript">
    document.captureEvents(Event.KEYDOWN);      
    document.onkeydown = goKey; 
	function goKey(e) {
		var y=String.fromCharCode(e.which);
	if(y=="B"){
		e.stopPropagation();
		e.preventDefault();
		history.back();
		}
			}
</script>
';
	         }
print;
	}





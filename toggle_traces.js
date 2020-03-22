toggle = function(){
   console.log("AB")
   legendtoggles = document.getElementsByClassName("legendtoggle")
   legendtexts = document.getElementsByClassName("legendtext")
   toggled = false
   for( i=0; i < legendtoggles.length; i++ ) {
   	   country = legendtexts[i].getAttribute("data-unformatted")
   	   if( country == "Germany" ) {
   	   	   console.log( country )
		   legendtoggles[i].dispatchEvent( new Event("mousedown") )
		   legendtoggles[i].dispatchEvent( new Event("mouseup") )
		   legendtoggles[i].dispatchEvent( new Event("mousedown") )
		   legendtoggles[i].dispatchEvent( new Event("mouseup") ) 
		   toggled = true
		}
	} 
	if( !toggled ) {
       setTimeout( toggle, 1000 );
	}
}

toggle();


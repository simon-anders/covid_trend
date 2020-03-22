<script>
setTimeout( function(){
   legendtoggles = document.getElementsByClassName("legendtoggle")
   legendtoggles[4].dispatchEvent( new Event("mousedown") )
   legendtoggles[4].dispatchEvent( new Event("mouseup") )
   legendtoggles[4].dispatchEvent( new Event("mousedown") )
   legendtoggles[4].dispatchEvent( new Event("mouseup") )
}, 1000 );
</script>


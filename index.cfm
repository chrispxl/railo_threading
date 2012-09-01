<h1>railo threading</h1>
<cfscript>
timestamp = dateDiff( 's', createDate(1970,1,1), now() );
threadName = "thread_#timestamp#";
//writeDump( threadName );

thread name="#threadName#" duration=0 timeout=60 {
	WriteLog(type="Info", file="threadtest.log", text="thread: #threadName# started");
	for( i = 1; i lt 10; i=i+1 ) {
		sleep(500);
		WriteLog(type="Info", file="threadtest.log", text="thread: #threadName# position: #i#");
	}
	WriteLog(type="Info", file="threadtest.log", text="thread: #threadName# complete");
}
writeDump( evaluate("#threadName#") );
</cfscript>
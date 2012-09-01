<h1>railo threading</h1>
<cfscript>
timestamp  = dateDiff( 'n', createDate(1970,1,1), now() );
threadName = "thread_#timestamp#";

writeOutput("threadName: #threadName#");
try {
	writeDump( "test: " & cfthread["#threadName#"].status );
}catch (any e) {

	thread name="#threadName#" duration=0 timeout=60 {
		iterator = 1;
		private void function runtest( ) hint="Run a simple thread test" {
			WriteLog(type="Info", file="threadtest.log", text="thread: #threadName# started");
			for( i = 1; i lt 10; i=i+1 ) {
				iterator = i;
				sleep(500);
				WriteLog(type="Info", file="threadtest.log", text="thread: #threadName# position: #i#");
			}
			WriteLog(type="Info", file="threadtest.log", text="thread: #threadName# complete");
		}
		
		runTest();
		writeOutput( iterator );
		
	}
}
writeDump( "cfthread: " & cfthread["#threadName#"].status );
writeDump( cfthread["#threadName#"].status );
writeDump( cfthread["#threadName#"] );
</cfscript>
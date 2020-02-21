<cfcomponent
	output="false"
	hint="I define the unit-testing application settings.">


	<!--- Define the application settings. --->
	<cfset this.name = "Unit Testing with MXUnit" />
	<cfset this.applicationTimeout = createTimeSpan( 0, 0, 5, 0 ) />

	<!---
		I am explicitly turning off session management for the MXUnit
		testing since I don't believe I want this level of testing
		for my "units." Sessions are managed in the Controller, not
		in my Model.
	--->
	<cfset this.sessionManagement = false />

	<!---
		Get the tests directory - we'll be setting up mappings for
		directories relative to our testing directory.
	--->
	<cfset this.directory = getDirectoryFromPath( getCurrentTemplatePath() ) />

	<!---
		Get our MXUnit directory - we'll need this in order to run
		the test suties from our tests directory.
	--->
	<cfset this.mxunitDirectory = (this.directory & "../mxunit/") />

	<!---
		Get the application-root directory (where our non-MXUnit,
		application code exists).
	--->
	<cfset this.appDirectory = (this.directory & "../../") />


	<!---
		***** MX UNIT FRAMEWORK *****
		Set up a mapping to the MXUnit framework; this is requied for
		the framework installation to run without a global mapping.
	--->
	<cfset this.mappings[ "/mxunit" ] = this.mxunitDirectory />

	<!---
		***** TEST SPECIFICATIONS *****
		Map the spec folder so that our local tests can be located
		from within the MXUnit framework components.
	--->
	<cfset this.mappings[ "/spec" ] = (this.directory & "spec/") />

	<!---
		***** APPLICATION COMPONENTS *****
		Map the Model directory so we can include our application's
		components for unit testing.
	--->
	<cfset this.mappings[ "/model" ] = (this.appDirectory & "model/") />


</cfcomponent>
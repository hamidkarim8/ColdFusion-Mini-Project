<cfcomponent>
    <cfset this.name = "TestProjectSource">
    <cfset this.sessionManagement = true>
    <cfset this.sessionTimeout = createTimeSpan(0, 0, 30, 0)>
    <cfset this.applicationTimeout = createTimeSpan(5, 0, 0, 0)>

    <cffunction name="onApplicationStart" returnType="boolean">
        <cfset application.name = "TestProject Application">
        <cfreturn true>
    </cffunction>

    <cffunction name="onSessionStart" returnType="boolean">
        <cfset session.isLoggedIn = false>
        <cfreturn true>
    </cffunction>

</cfcomponent>

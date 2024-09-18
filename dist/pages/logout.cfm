<cfif structKeyExists(session, "isLoggedIn") AND session.isLoggedIn>
    <cflock scope="session" timeout="30">
        <cfset structDelete(session, "isLoggedIn")>
        <cfset sessionInvalidate()>
    </cflock>
</cfif>

<cflocation url="index.cfm">

<cftry>
    <cfparam name="form.userId" default="">
    <cfparam name="form.action" default="">

    <cfif form.action eq 'delete'>
        <cfquery datasource="TestProjectSource">
            DELETE FROM Users
            WHERE UserID = <cfqueryparam value="#form.userId#" cfsqltype="cf_sql_integer">
        </cfquery>

        <cfoutput>
            {"success": true}
        </cfoutput>
    <cfelse>
        <cfoutput>
            {"success": false, "message": "Invalid action"}
        </cfoutput>
    </cfif>

<cfcatch>
    <cfoutput>
        {"success": false, "message": "#cfcatch.message#"}
    </cfoutput>
</cfcatch>
</cftry>

<cftry>
    <cfparam name="form.userId" default="">
    <cfparam name="form.username" default="">
    <cfparam name="form.firstName" default="">
    <cfparam name="form.lastName" default="">
    <cfparam name="form.phoneNumber" default="">
    <cfparam name="form.email" default="">
    <cfparam name="form.role" default="">
    <cfparam name="form.status" default="">

    <cfquery datasource="TestProjectSource">
        UPDATE Users
        SET UserName = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar" maxlength="50">,
            FirstName = <cfqueryparam value="#form.firstName#" cfsqltype="cf_sql_varchar" maxlength="50">,
            LastName = <cfqueryparam value="#form.lastName#" cfsqltype="cf_sql_varchar" maxlength="50">,
            PhoneNumber = <cfqueryparam value="#form.phoneNumber#" cfsqltype="cf_sql_varchar" maxlength="15">,
            Email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar" maxlength="100">,
            RoleID = <cfqueryparam value="#form.role#" cfsqltype="cf_sql_integer">,
            Status = <cfqueryparam value="#form.status#" cfsqltype="cf_sql_varchar" maxlength="10">
        WHERE UserID = <cfqueryparam value="#form.userId#" cfsqltype="cf_sql_integer">
    </cfquery>

    <cfoutput>
        {"success": true}
    </cfoutput>

<cfcatch>
    <cfoutput>
        {"success": false, "message": "#cfcatch.message#"}
    </cfoutput>
</cfcatch>
</cftry>

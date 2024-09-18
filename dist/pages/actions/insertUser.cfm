<cftry>
    <cfparam name="form.username" default="">
    <cfparam name="form.email" default="">
    <cfparam name="form.password" default="">
    <cfparam name="form.firstName" default="">
    <cfparam name="form.lastName" default="">
    <cfparam name="form.phoneNumber" default="">
    <cfparam name="form.role" default="">

    <!-- Check if the username or email already exists -->
    <cfquery name="checkExisting" datasource="TestProjectSource">
        SELECT UserName, Email
        FROM Users
        WHERE UserName = <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar">
           OR Email = <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <!-- If username or email is found, return an error -->
    <cfif checkExisting.recordcount gt 0>
        <cfif checkExisting.UserName EQ form.username>
            <cfoutput>Username is already taken. Please choose a different one.</cfoutput>
            <cfabort>
        </cfif>
        
        <cfif checkExisting.Email EQ form.email>
            <cfoutput>Email is already registered. Please use a different email address.</cfoutput>
            <cfabort>
        </cfif>
    </cfif>

    <cfset hashedPassword = hash(form.password, "SHA-256")>

    <cfquery datasource="TestProjectSource">
        INSERT INTO Users (UserName, Email, PasswordHash, FirstName, LastName, PhoneNumber, RoleID, CreatedAt, Status)
        VALUES (
            <cfqueryparam value="#form.username#" cfsqltype="cf_sql_varchar" maxlength="50">,
            <cfqueryparam value="#form.email#" cfsqltype="cf_sql_varchar" maxlength="100">,
            <cfqueryparam value="#hashedPassword#" cfsqltype="cf_sql_varchar" maxlength="64">,
            <cfqueryparam value="#form.firstName#" cfsqltype="cf_sql_varchar" maxlength="50">,
            <cfqueryparam value="#form.lastName#" cfsqltype="cf_sql_varchar" maxlength="50">,
            <cfqueryparam value="#form.phoneNumber#" cfsqltype="cf_sql_varchar" maxlength="15">,
            <cfqueryparam value="#form.role#" cfsqltype="cf_sql_integer">,
            <cfqueryparam value="#now()#" cfsqltype="cf_sql_timestamp">,
            <cfqueryparam value="Active" cfsqltype="cf_sql_varchar" maxlength="10">
        )
    </cfquery>

    <cflocation url="../userRecord.cfm">

<cfcatch>
    <cfoutput>Error: #cfcatch.message#</cfoutput>
</cfcatch>
</cftry>

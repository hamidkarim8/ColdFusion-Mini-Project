<cfif isDefined("form.submit")>
    <cfif structKeyExists(session, "userName")>
        <cfset fundUID = listFirst(form.fund_name)>
        <cfset fundName = listGetAt(form.fund_name, 2)>
        
        <cfquery datasource="TestProjectSource">
            INSERT INTO SelectedFund (FUNDUID, FUNDNAME, CreatedBy, CreatedDate)
            VALUES (
                <cfqueryparam value="#fundUID#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#fundName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#session.userName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#Now()#" cfsqltype="CF_SQL_TIMESTAMP">
            )
        </cfquery>

        <cflocation url="../fundRecord.cfm">
    </cfif>
</cfif>

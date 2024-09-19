<cfif isDefined("form.submit")> <!-- Check if form is submitted -->
    <cfif structKeyExists(session, "userName")> <!-- Ensure session contains userName -->
        <cfset fundUID = listFirst(form.fund_name)>
        <cfset fundName = listGetAt(form.fund_name, 2)>
        
        <!-- Perform the insertion into the SelectedFund table -->
        <cfquery datasource="TestProjectSource">
            INSERT INTO SelectedFund (FUNDUID, FUNDNAME, CreatedBy, CreatedDate)
            VALUES (
                <cfqueryparam value="#fundUID#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#fundName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#session.userName#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#Now()#" cfsqltype="CF_SQL_TIMESTAMP">
            )
        </cfquery>

        <!-- Redirect to the fund list page or another success page -->
        <cflocation url="../fundRecord.cfm">
    </cfif>
</cfif>

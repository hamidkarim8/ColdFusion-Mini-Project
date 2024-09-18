<cfquery name="getUserRecords" datasource="TestProjectSource">
    SELECT Users.*, roleTable.RoleName
    FROM Users
    JOIN Roles roleTable ON roleTable.RoleID = Users.RoleID
</cfquery>


<cfif session.roleID EQ 2>
    <!-- If roleID is 2 (staff), only fetch their own record -->
    <cfquery name="getUserRecords" datasource="TestProjectSource">
    SELECT Users.*, roleTable.RoleName
    FROM Users
    JOIN Roles roleTable ON roleTable.RoleID = Users.RoleID
        WHERE UserID = <cfqueryparam value="#session.userID#" cfsqltype="cf_sql_integer">
    </cfquery>
<cfelse>
    <!-- If roleID is 1 (admin), fetch all records -->
    <cfquery name="getUserRecords" datasource="TestProjectSource">
    SELECT Users.*, roleTable.RoleName
    FROM Users
    JOIN Roles roleTable ON roleTable.RoleID = Users.RoleID
    </cfquery>
</cfif>
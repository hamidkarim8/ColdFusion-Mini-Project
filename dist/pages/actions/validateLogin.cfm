<cfif structKeyExists(form, "username") AND structKeyExists(form, "password")>
    <cfset username = trim(form.username)>
    <cfset password = trim(form.password)>

    <cfquery name="getUser" datasource="TestProjectSource">
        SELECT UserID, UserName, PasswordHash, RoleID
        FROM Users
        WHERE UserName = <cfqueryparam value="#username#" cfsqltype="cf_sql_varchar">
    </cfquery>

    <cfif getUser.recordCount EQ 1>
        <cfset dbPasswordHash = getUser.PasswordHash>
        <cfset inputPasswordHash = hash(password, "SHA-256")>

        <cfif dbPasswordHash EQ inputPasswordHash>
            <cflock scope="session" timeout="30">
                <cfset session.isLoggedIn = true>
                <cfset session.userID = getUser.UserID>
                <cfset session.userName = getUser.UserName>
                <cfset session.roleID = getUser.RoleID>
            </cflock>
            <cflocation url="../dashboard.cfm">
        <cfelse>
            <script>
                alert("Invalid username or password. Please try again.");
                window.location.href = "../index.cfm";
            </script>
        </cfif>
    <cfelse>
        <script>
            alert("Invalid username or password. Please try again.");
            window.location.href = "../index.cfm";
        </script>
    </cfif>
</cfif>

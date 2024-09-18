<cfquery name="getFundManagers" datasource="TestProjectSource">
    SELECT [UID], [Name]
    FROM [TestProject].[dbo].[FS_FundManager]
</cfquery>

<cfset result = []>
<cfloop query="getFundManagers">
    <cfset arrayAppend(result, {id = getFundManagers.UID, name = getFundManagers.Name})>
</cfloop>

<cfoutput>#serializeJSON(result)#</cfoutput>

<cfquery name="getAssetClasses" datasource="TestProjectSource">
    SELECT [FundAssetClassId], [FundAssetClass]
    FROM [TestProject].[dbo].[FS_FundAssetClass]
</cfquery>

<cfset result = []>
<cfloop query="getAssetClasses">
    <cfset arrayAppend(result, {id = getAssetClasses.FundAssetClassId, name = getAssetClasses.FundAssetClass})>
</cfloop>

<cfoutput>#serializeJSON(result)#</cfoutput>

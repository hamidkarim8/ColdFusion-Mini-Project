<!-- Set the content type and charset properly using cfheader -->
<cfheader name="Content-Type" value="application/json; charset=UTF-8">

<!-- Create a result structure to hold the dropdown data -->
<cfset result = structNew()>

<!-- Query for Asset Classes -->
<cfquery name="assetClasses" datasource="TestProjectSource">
    SELECT [FundAssetClassId], [FundAssetClass]
    FROM [TestProject].[dbo].[FS_FundAssetClass]
</cfquery>
<cfset result.assetClasses = []>
<cfloop query="assetClasses">
    <cfset arrayAppend(result.assetClasses, {id=assetClasses.FundAssetClassId, name=assetClasses.FundAssetClass})>
</cfloop>

<!-- Query for Fund Management -->
<cfquery name="fundManagements" datasource="TestProjectSource">
    SELECT [UID], [Name]
    FROM [TestProject].[dbo].[FS_FundManager]
</cfquery>
<cfset result.fundManagements = []>
<cfloop query="fundManagements">
    <cfset arrayAppend(result.fundManagements, {id=fundManagements.UID, name=fundManagements.Name})>
</cfloop>

<!-- Query for Fund Names -->
<cfquery name="fundNames" datasource="TestProjectSource">
    SELECT [UID], [Name]
    FROM [TestProject].[dbo].[FS_UnitTrust]
</cfquery>
<cfset result.fundNames = []>
<cfloop query="fundNames">
    <cfset arrayAppend(result.fundNames, {id=fundNames.UID, name=fundNames.Name})>
</cfloop>

<!-- Output the JSON response -->
<cfoutput>#SerializeJSON(result)#</cfoutput>

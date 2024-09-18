<!-- Query for Asset Classes -->
<cfquery name="assetClasses" datasource="TestProjectSource">
    SELECT [FundAssetClassId], [FundAssetClass]
    FROM [TestProject].[dbo].[FS_FundAssetClass]
</cfquery>

<!-- Query for Fund Management -->
<cfquery name="fundManagements" datasource="TestProjectSource">
    SELECT [UID], [Name]
    FROM [TestProject].[dbo].[FS_FundManager]
</cfquery>

<!-- Query for Fund Names -->
<cfquery name="fundNames" datasource="TestProjectSource">
    SELECT [UID], [Name]
    FROM [TestProject].[dbo].[FS_UnitTrust]
</cfquery>

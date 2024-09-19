<cfset assetClassIds = DeserializeJSON(form.assetClassIds)>
<cfset fundManagerIds = DeserializeJSON(form.fundManagerIds)>

<cfset formattedAssetClassIds = arrayToList(assetClassIds, ",")>
<cfset formattedFundManagerIds = arrayToList(fundManagerIds, ",")>

<cfquery name="getFundNames" datasource="TestProjectSource">
    SELECT [UID], [Name]
    FROM [TestProject].[dbo].[FS_UnitTrust]
    WHERE 
    <cfif arrayLen(assetClassIds) GT 0>
        [AssetClassId] IN (<cfqueryparam value="#formattedAssetClassIds#" cfsqltype="cf_sql_varchar" list="true">)
    <cfelse>
        1=1
    </cfif>
    AND
    <cfif arrayLen(fundManagerIds) GT 0>
        [FundMgrUID] IN (<cfqueryparam value="#formattedFundManagerIds#" cfsqltype="cf_sql_varchar" list="true">)
    <cfelse>
        1=1
    </cfif>
    ORDER BY [Name] ASC
</cfquery>

<cfset result = []>
<cfloop query="getFundNames">
    <cfset arrayAppend(result, {id = getFundNames.UID, name = getFundNames.Name})>
</cfloop>

<cfoutput>#serializeJSON(result)#</cfoutput>

<cfset assetClassIds = DeserializeJSON(form.assetClassIds)>
<cfset fundManagerIds = DeserializeJSON(form.fundManagerIds)>

<cfset formattedAssetClassIds = arrayToList(assetClassIds, "','")>
<cfset formattedFundManagerIds = arrayToList(fundManagerIds, "','")>

<cfquery name="getFundNames" datasource="TestProjectSource">
    SELECT [UID], [Name]
    FROM [TestProject].[dbo].[FS_UnitTrust]
    WHERE 
    <cfif arrayLen(assetClassIds) GT 0>
        [AssetClassId] IN ('<cfoutput>#formattedAssetClassIds#</cfoutput>')
    <cfelse>
        1=1
    </cfif>
    AND
    <cfif arrayLen(fundManagerIds) GT 0>
        [FundMgrUID] IN ('<cfoutput>#formattedFundManagerIds#</cfoutput>')
    <cfelse>
        1=1
    </cfif>
</cfquery>

<cfset result = []>
<cfloop query="getFundNames">
    <cfset arrayAppend(result, {id = getFundNames.UID, name = getFundNames.Name})>
</cfloop>

<cfoutput>#serializeJSON(result)#</cfoutput>

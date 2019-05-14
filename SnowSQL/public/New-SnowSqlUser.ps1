function New-SnowSqlUser
{
    <#
    .SYNOPSIS
    Create a new Snowflake user account

    .DESCRIPTION
    Create a new Snowflake user account

    .EXAMPLE
    New-SnowSqlUser -Name TESTUSER -LoginName TESTUSER@CONTOSO.COM -Description 'AD Account'

    .NOTES
    Current use case is for creating AD users in Snowflake. Local accounts may need different options.
    #>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification="Implemented in Invoke-SnowSql")]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # Name of the Snowflake user
        [Alias('SamAccountName')]
        [parameter(
            Mandatory,
            ValueFromPipelineByPropertyName
        )]
        [string]
        $Name,

        # Login or Active Directory account name
        [Alias('UserPrincipalName')]
        [parameter(
            Mandatory,
            ValueFromPipelineByPropertyName
        )]
        [string]
        $LoginName,

        # Description of the user account
        [Alias('Comment')]
        [parameter(
            ValueFromPipelineByPropertyName
        )]
        [string]
        $Description,

        # Return the command instead of the results
        [switch]
        $DSL
    )

    begin
    {
        $template = "CREATE USER {0} LOGIN_NAME='{1}' MUST_CHANGE_PASSWORD=FALSE COMMENT='{2}';"
    }

    process
    {
        $Query = $template -f $Name, $LoginName, $Description

        if ($DSL)
        {
            $Query
        }
        else
        {
            Invoke-SnowSql -Query $Query
        }

        Enable-SnowSqlUser -Name $Name -DSL:$DSL
    }
}

function Get-SnowSqlUser
{
    <#
    .SYNOPSIS
    Get list of Snowflake users

    .DESCRIPTION
    Get list of Snowflake users

    .EXAMPLE
    Get-SnowSqlUser

    .NOTES

    #>

    [OutputType('System.String')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification="Implemented in Invoke-SnowSql")]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # User to return
        [Alias('User')]
        [SupportsWildcards()]
        [parameter(
            ValueFromPipelineByPropertyName
        )]
        [string]
        $Name='*',

        # Return the command instead of the results
        [switch]
        $DSL
    )

    begin
    {
        $Query = 'SHOW USERS;'

        if ($DSL)
        {
            return $Query
        }

        $results = Invoke-SnowSql -Query $Query
    }

    process
    {
        if (-Not $DSL)
        {
            $results | Where-Object Name -Like $Name
        }
    }
}

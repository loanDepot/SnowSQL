function Get-SnowSqlRole
{
    <#
    .SYNOPSIS
    Get list of Snowflake roles

    .DESCRIPTION
    Get list of Snowflake roles

    .EXAMPLE
    Get-SnowSqlRole

created_on                    name                         is_default is_current is_inherited assigned_to_users granted_to_roles granted_role                                                                                                                        s
----------                    ----                         ---------- ---------- ------------ ----------------- ---------------- ------------
2020-02-01 12:31:05.000 -0800 ACTADMIN                     N          N          N            0                 0                0
2020-02-01 12:31:05.000 -0800 PUB                          N          N          Y            0                 0                0
2020-02-01 12:31:05.000 -0800 SECURITY                     Y          Y          N            0                 0                0
2020-02-01 12:31:05.000 -0800 ADMIN                        N          N          N            0                 0                0

    .NOTES

    #>

    [OutputType('System.String')]
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification="Implemented in Invoke-SnowSql")]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # Role to return
        [Alias('Role')]
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
        $Query = 'SHOW ROLES;'

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

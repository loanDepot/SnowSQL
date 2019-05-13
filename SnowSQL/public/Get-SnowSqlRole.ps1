function Get-SnowSqlRole
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification="Implemented in Invoke-SnowSql")]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # Return the command instead of the results
        [switch]
        $DSL
    )
    end
    {
        $Query = 'SHOW ROLES;'

        if ($DSL)
        {
            return $Query
        }

        Invoke-SnowSql -Query $Query

    }
}

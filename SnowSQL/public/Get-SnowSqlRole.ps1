function Get-SnowSqlRole
{
    [cmdletbinding()]
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

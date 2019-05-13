function Get-SnowSqlUser
{
    [cmdletbinding()]
    param(
        # Return the command instead of the results
        [switch]
        $DSL
    )

    end
    {
        $Query = 'SHOW USERS;'

        if ($DSL)
        {
            return $Query
        }

        Invoke-SnowSql -Query $Query
    }
}

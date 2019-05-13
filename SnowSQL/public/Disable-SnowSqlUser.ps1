function Disable-SnowSqlUser
{
    [cmdletbinding()]
    param(
        [Alias('SamAccountName')]
        [parameter(
            Mandatory,
            ValueFromPipelineByPropertyName
        )]
        [string]
        $Name,

        # Return the command instead of the results
        [switch]
        $DSL
    )

    begin
    {
        $template = 'ALTER USER {0} SET DISABLED=TRUE;'
    }

    process
    {
        $Query = $template -f $Name

        if ($DSL)
        {
            return $Query
        }

        Invoke-SnowSql -Query $Query
    }
}

function Add-SnowSqlRoleMember
{
    [cmdletbinding()]
    param(
        [parameter(
            Mandatory,
            ValueFromPipelineByPropertyName
        )]
        [string]
        $Role,

        [Alias('Member')]
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
        $template = 'GRANT ROLE {0} TO USER {1};'
    }
    process
    {
        $Query = $template -f $Role, $Name

        if ($DSL)
        {
            return $Query
        }

        Invoke-SnowSql -Query $Query
    }
}

function New-SnowSqlRole
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification="Implemented in Invoke-SnowSql")]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        [parameter(
            Mandatory,
            ValueFromPipelineByPropertyName
        )]
        [string]
        $Role,

        # Return the command instead of the results
        [switch]
        $DSL
    )
    begin
    {
        $template = 'CREATE ROLE {0};'
    }
    process
    {
        $Query = $template -f $Role

        if ($DSL)
        {
            return $Query
        }

        Invoke-SnowSql -Query $Query
    }
}

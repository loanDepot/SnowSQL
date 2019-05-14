function New-SnowSqlRole
{
    <#
    .SYNOPSIS
    Create a new Snowflake role

    .DESCRIPTION
     Create a new Snowflake role

    .EXAMPLE
    New-SnowSqlRole -Role TEST_ROLE

    .NOTES

    #>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification="Implemented in Invoke-SnowSql")]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # Name of Role to create
        [Alias('Name')]
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

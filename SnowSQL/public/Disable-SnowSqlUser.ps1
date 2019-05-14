function Disable-SnowSqlUser
{
    <#
    .SYNOPSIS
    Disable user account

    .DESCRIPTION
    Disable user account

    .EXAMPLE
    Disable-SnowSqlUser -Name TEST_USER

    .NOTES

    #>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification="Implemented in Invoke-SnowSql")]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # Name of user to disable
        [Alias('SamAccountName')]
        [parameter(
            Mandatory,
            Position = 0,
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

function Remove-SnowSqlRoleMember
{
    <#
    .SYNOPSIS
    Remove Snowflake user from role

    .DESCRIPTION
    Remove Snowflake user from role

    .EXAMPLE
    Remove-SnowSqlRoleMember -Role TEST_ROLE -Name TEST_USER

    .NOTES

    #>

    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification="Implemented in Invoke-SnowSql")]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # Name of Role to update
        [parameter(
            Mandatory,
            ValueFromPipelineByPropertyName
        )]
        [string]
        $Role,

        # User to remove from role
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
        $template = 'REVOKE ROLE {0} FROM USER {1};'
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

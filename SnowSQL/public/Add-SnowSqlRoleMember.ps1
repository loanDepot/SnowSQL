function Add-SnowSqlRoleMember
{
    <#
    .SYNOPSIS
    Add users to role

    .DESCRIPTION
    Add users to role

    .EXAMPLE
    Add-SnowSqlRoleMember -Role TEST_ROLE -Name TEST_USER

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

        # User to add to Role
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

function New-SnowSqlUser
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

        [Alias('UserPrincipalName')]
        [parameter(
            Mandatory,
            ValueFromPipelineByPropertyName
        )]
        [string]
        $LoginName,

        [Alias('Comment')]
        [parameter(
            ValueFromPipelineByPropertyName
        )]
        [string]
        $Description,

        # Return the command instead of the results
        [switch]
        $DSL
    )

    begin
    {
        $template = "CREATE USER {0} LOGIN_NAME='{1}' MUST_CHANGE_PASSWORD=FALSE COMMENT='{2}';"
    }

    process
    {
        $Query = $template -f $Name, $LoginName, $Description

        if ($DSL)
        {
            $Query
        }
        else
        {
            Invoke-SnowSql -Query $Query
        }

        Enable-SnowSqlUser -Name $Name -DSL:$DSL
    }
}

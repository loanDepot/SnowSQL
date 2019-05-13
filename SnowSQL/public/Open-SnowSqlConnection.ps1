function Open-SnowSqlConnection
{
    [OutputType('SnowSql.Connection')]
    [CmdletBinding()]
    param(
        #[Parameter(Mandatory)]
        [string]
        $Endpoint = "loandepot.east-us-2.azure",

        #[Parameter(Mandatory)]
        [PSCredential]
        $Credential = (Get-LDCredential 'SnowflakeUserAdmin_dv1')
    )

    end
    {
        $SnowSqlConnection = [PSCustomObject]@{
            PSTypeName = 'SnowSql.Connection'
            Endpoint   = $Endpoint
            Credential = $Credential
        }

        # Do basic connection test
        $invokeSnowSqlSplat = @{
            Query       = '!help'
            ErrorAction = 'Stop'
            Connection  = $SnowSqlConnection
        }
        $null = Invoke-SnowSql @invokeSnowSqlSplat
        $Script:SnowSqlConnection = $SnowSqlConnection

        return $Script:SnowSqlConnection
    }
}

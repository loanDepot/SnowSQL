function Open-SnowSqlConnection
{
    <#
    .SYNOPSIS
    Opens a connection to Snowflake

    .DESCRIPTION
    Establishes a few important environment values for connecting to snowflake

    .EXAMPLE
    Open-SnowSqlConnection -Endpoint contoso.east-us-2.azure -Credential (Get-Credential)

    .NOTES
    Will also execute a '!help' statement to verify connectivity
    #>

    [OutputType('SnowSql.Connection')]
    [CmdletBinding()]
    param(
        # Snowflake endpoint (ex: contoso.east-us-2.azure)
        [Parameter(Mandatory)]
        [string]
        $Endpoint,

        # Credential for snowflake endpoint
        [Parameter(Mandatory)]
        [PSCredential]
        $Credential
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

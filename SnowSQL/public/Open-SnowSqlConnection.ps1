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
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSShouldProcess", "", Justification = "Implemented in Invoke-SnowSql")]
    [cmdletbinding(SupportsShouldProcess)]
    param(
        # Snowflake endpoint (ex: contoso.east-us-2.azure)
        [Parameter(Mandatory)]
        [string]
        $Endpoint,

        # Credential for snowflake endpoint
        [Parameter(Mandatory)]
        [PSCredential]
        $Credential,

        # Login timeout in seconds
        [int]
        $Timeout = 10
    )
    begging
    {
        if ($Endpoint -match '(http[s]?)(:\/\/)([^\s,]+)')
        {
            Write-Error ("Snowflake endpoint must not be a URL {0}" -f $Endpoint) -ErrorAction Stop
        }
    }

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
            timeout     = $Timeout
        }
        $Result = Invoke-SnowSql @invokeSnowSqlSplat
        if (-not $Result)
        {
            Write-Error ("Unable to connect to SnowSql endpoint {0}" -f $Endpoint) -ErrorAction Stop
        }
        else
        {
            return $Script:SnowSqlConnection
        }
    }
}

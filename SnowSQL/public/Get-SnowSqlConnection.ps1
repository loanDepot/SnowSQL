function Get-SnowSqlConnection
{
    <#
    .SYNOPSIS
    Gets the current Snowflake connection

    .DESCRIPTION
    Gets the current Snowflake connection

    .EXAMPLE
    Get-SnowSqlConnection

Endpoint                    Credential
--------                    ----------
contoso.east-us-2.azure     System.Management.Automation.PSCredential

    .NOTES

    #>

    [OutputType('SnowSql.Connection')]
    [CmdletBinding()]
    param()

    end
    {
        if ($Script:SnowSqlConnection)
        {
            return $Script:SnowSqlConnection
        }
        else
        {
            Write-Error "Unable to find a SnowSql session. Run Open-SnowSqlConnection to create one." -ErrorAction Stop
        }

    }
}

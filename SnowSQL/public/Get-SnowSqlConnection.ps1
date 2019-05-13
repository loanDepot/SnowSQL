function Get-SnowSqlConnection
{
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

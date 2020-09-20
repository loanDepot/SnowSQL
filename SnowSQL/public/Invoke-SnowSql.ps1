function Invoke-SnowSql
{
    <#
    .SYNOPSIS
    Invokes a Snowflake SQL statement

    .DESCRIPTION
    Invokes a Snowflake SQL statement

    .EXAMPLE
    Open-SnowSqlConnection
    Invoke-SnowSql -Query '!help'

    .NOTES
    Error handling does not exist at the moment
    #>

    [cmdletbinding(
        DefaultParameterSetName = 'QueryConnection',
        SupportsShouldProcess
    )]
    param(
        # Snowflake endpoint (ex: contoso.east-us-2.azure)
        [Parameter(ParameterSetName = 'QueryCred', Mandatory)]
        [Parameter(ParameterSetName = 'PathCred', Mandatory)]
        [string]
        $Endpoint,

        # Credential for snowflake endpoint
        [Parameter(ParameterSetName = 'QueryCred', Mandatory)]
        [Parameter(ParameterSetName = 'PathCred', Mandatory)]
        [PSCredential]
        $Credential,

        # An existing connection made with Open-SnowSqlConnection
        [Parameter(ParameterSetName = 'QueryConnection')]
        [Parameter(ParameterSetName = 'PathConnection')]
        [PSTypeName('SnowSql.Connection')]
        $Connection,

        # Query to invoke
        [Parameter(ParameterSetName = 'QueryCred')]
        [Parameter(ParameterSetName = 'QueryConnection')]
        [string[]]
        $Query = '!help',

        # Login timeout in seconds
        [Parameter(ParameterSetName = 'QueryCred')]
        [Parameter(ParameterSetName = 'QueryConnection')]
        [int]
        $Timeout = 10,

        # SnowSql script file to execute
        [Parameter(ParameterSetName = 'PathCred')]
        [Parameter(ParameterSetName = 'PathConnection')]
        [string]
        $Path
    )

    begin
    {
        try
        {
            $snowSql = Get-Command snowsql -ErrorAction Stop |
                Select-Object -First 1 -ExpandProperty Source
        }
        catch
        {
            Write-Error "Could not find [snowsql.exe] on local system. Install snowsql.exe and make it available in the %path%. Install instructions can be found here [https://docs.snowflake.net/manuals/user-guide/snowsql-install-config.html]" -ErrorAction Stop
        }

        if ($PSCmdlet.ParameterSetName -match 'Connection$')
        {
            if ( -not $Connection )
            {
                $Connection = Get-SnowSqlConnection
            }
            $Credential = $Connection.Credential
            $Endpoint = $Connection.Endpoint
        }
    }

    process
    {
        $singleLineQuery = $Query -join [environment]::NewLine

        # make sure the query is not too long for the commandline
        $maxCommandLength = 500
        if ($singleLineQuery.Length -ge $maxCommandLength)
        {
            $Path = New-TemporaryFile
            Write-Verbose "Saving query to file [$Path]"

            #Setting to UTF8 without BOM as snowsql commands for files with BOM fail
            [System.IO.File]::WriteAllLines($Path, $Query)
        }

        $snowSqlParam = @(
            '--accountname', $Endpoint
            '--username', $Credential.UserName
            '--option', 'exit_on_error=true'
            '--option', 'output_format=csv'
            '--option', 'friendly=false'
            '--option', 'timing=false'
            if ($Debug)
            {
                '--option', 'log_level=DEBUG'
            }
            if ($timeout)
            {
                '--option', $('login_timeout=' + $timeout)
            }
            if ($Path)
            {
                '--filename', $Path
            }
            else
            {
                '--query', $singleLineQuery
            }
        )

        $results = $null
        Write-Debug ("Executing [& '$snowsql' $snowSqlParam]" -f $snowsql)
        if ($PSCmdlet.ShouldProcess("Execute SnowSql on [$Endpoint] as [$($Credential.UserName)]. Use -Debug to see full command"))
        {
            $env:SNOWSQL_PWD = $Credential.GetNetworkCredential().Password
            try
            {
                $executeQuery = & $snowsql @snowSqlParam 2>&1
                $results = $executeQuery | ConvertFrom-Csv
            }
            catch
            {
                Write-Error ("An error occurred while executing a request [{0}]. Use -Debug to see full command" -f $_)
            }
            $env:SNOWSQL_PWD = ""
            Write-Verbose "LastExitCode[$LastExitCode]"
        }
        $results
    }
}

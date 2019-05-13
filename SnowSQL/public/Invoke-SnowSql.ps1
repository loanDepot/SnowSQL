function Invoke-SnowSql
{
    [cmdletbinding(
        DefaultParameterSetName = 'QueryConnection',
        SupportsShouldProcess
    )]
    param(
        [Parameter(ParameterSetName = 'QueryCred', Mandatory)]
        [Parameter(ParameterSetName = 'PathCred', Mandatory)]
        [string]
        $Endpoint,

        [Parameter(ParameterSetName = 'QueryCred', Mandatory)]
        [Parameter(ParameterSetName = 'PathCred', Mandatory)]
        [PSCredential]
        $Credential,

        [Parameter(ParameterSetName = 'QueryConnection')]
        [Parameter(ParameterSetName = 'PathConnection')]
        [PSTypeName('SnowSql.Connection')]
        $Connection,

        [Parameter(ParameterSetName = 'QueryCred')]
        [Parameter(ParameterSetName = 'QueryConnection')]
        [string[]]
        $Query = '!help',

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

        if($PSCmdlet.ParameterSetName -match 'Connection$')
        {
            if( -not $Connection )
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
            $Query | Set-Content -Path $Path -Encoding UTF8
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
            if ($Path)
            {
                '--filename', $Path
            }
            else
            {
                '--query', $singleLineQuery
            }
        )

        Write-Debug ("Executing [& '$snowsql' $snowSqlParam]" -f $snowsql)
        if ($PSCmdlet.ShouldProcess("Execute SnowSql on [$Endpoint] as [$($Credential.UserName)]. Use -Debug to see full command"))
        {
            $env:SNOWSQL_PWD = $Credential.GetNetworkCredential().password
            $results = & $snowsql @snowSqlParam | ConvertFrom-Csv
            $env:SNOWSQL_PWD = ""
            Write-Verbose "LastExitCode[$LastExitCode]"
        }

        $results
    }
}

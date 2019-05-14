Describe 'Function Open-SnowSqlConnection' -Tag Build {
    It 'Open SnowSql Connection ' {
        Mock Invoke-SnowSql -Verifiable {}
        Open-SnowSqlConnection -Endpoint "test" -Credential ([pscredential]::Empty)
    }
}

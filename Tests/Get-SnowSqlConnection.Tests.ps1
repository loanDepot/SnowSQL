InModuleScope SnowSQL {
    Describe 'Function Get-SnowSqlConnection' -Tag Build {
        It 'Get SnowSql Connection' {
            Mock Invoke-SnowSql -Verifiable {}
            Open-SnowSqlConnection -Endpoint "test" -Credential ([pscredential]::Empty)
            Get-SnowSqlConnection | Should -Not -BeNullOrEmpty
        }
    }
}

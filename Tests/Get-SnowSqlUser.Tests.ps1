Describe 'Function Get-SnowSqlUser' -Tag Build {
    It 'Get SnowSql User' {
        $result = Get-SnowSqlUser -DSL
        # Keywords
        $result | Should -Match 'SHOW USERS'

        # Trailing semicolin
        $result | Should -Match ';$'
    }
}

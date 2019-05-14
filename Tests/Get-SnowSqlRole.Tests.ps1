Describe 'Function Get-SnowSqlRole' -Tag Build {
    It 'Get SnowSql Role ' {
        $result = Get-SnowSqlRole -DSL

        # Keywords
        $result | Should -Match 'SHOW ROLES'

        # Trailing semicolin
        $result | Should -Match ';$'
    }
}

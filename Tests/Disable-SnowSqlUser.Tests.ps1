Describe 'Function Disable-SnowSqlUser' -Tag Build {
    It 'Disable SnowSql User' {
        $result = Disable-SnowSqlUser -Name 'TEST_USER' -DSL

        # Keywords
        $result | Should -Match 'ALTER USER'
        $result | Should -Match 'SET DISABLED=TRUE'

        # Inserted values
        $result | Should -Match 'TEST_USER'

        # Trailing semicolin
        $result | Should -Match ';$'

        # Names are not quoted
        $result | Should -Not -Match '"'
        $result | Should -Not -Match "'"
    }
}

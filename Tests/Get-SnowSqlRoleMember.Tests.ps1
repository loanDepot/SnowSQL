Describe 'Function Get-SnowSqlRoleMember' -Tag Build {
    It 'Get SnowSql Role Member ' {
        $result = Get-SnowSqlRoleMember -Role 'TEST_ROLE' -DSL

        # Keywords
        $result | Should -Match 'SHOW GRANTS OF ROLE'

        # Inserted values
        $result | Should -Match 'TEST_ROLE'

        # Trailing semicolin
        $result | Should -Match ';$'

        # Names are not quoted
        $result | Should -Not -Match '"'
        $result | Should -Not -Match "'"
    }
}

Describe 'Function Add-SnowSqlRoleMember' -Tag Build {
    It 'Add SnowSql Role Member Syntax' {
        $splat = @{
            Name = "TEST_USER"
            Role = "TEST_ROLE"
            DSL = $true
        }
        $result = Add-SnowSqlRoleMember @splat

        # Keywords
        $result | Should -Match 'GRANT ROLE'
        $result | Should -Match 'TO USER'

        # Inserted values
        $result | Should -Match 'TEST_ROLE'
        $result | Should -Match 'TEST_USER'

        # Trailing semicolin
        $result | Should -Match ';$'

        # Names are not quoted
        $result | Should -Not -Match '"'
        $result | Should -Not -Match "'"
    }
}

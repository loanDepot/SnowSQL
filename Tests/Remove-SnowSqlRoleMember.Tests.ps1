Describe 'Function Remove-SnowSqlRoleMember' -Tag Build {
    It 'Remove SnowSqlRoleMember ' {

        $splat = @{
            Name = "TEST_USER"
            Role = "TEST_ROLE"
            DSL = $true
        }
        $result = Remove-SnowSqlRoleMember @splat

        # Keywords
        $result | Should -Match 'REVOKE ROLE'
        $result | Should -Match 'FROM USER'

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

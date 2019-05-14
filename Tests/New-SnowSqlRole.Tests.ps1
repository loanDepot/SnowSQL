Describe 'Function New-SnowSqlRole' -Tag Build {
    It 'New SnowSql Role' {
        $result = New-SnowSqlRole -Role TEST_ROLE -DSL

        # Keywords
        $result | Should -Match 'CREATE ROLE'

        # Inserted values
        $result | Should -Match 'TEST_ROLE'

        # Trailing semicolin
        $result | Should -Match ';$'

        # Names are not quoted
        $result | Should -Not -Match '"'
        $result | Should -Not -Match "'"
    }
}

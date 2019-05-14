Describe 'Function Enable-SnowSqlUser' -Tag Build {
    It 'Enable Snow SqlUser' {
        $result = Enable-SnowSqlUser -Name 'TEST_USER' -DSL

        # Keywords
        $result | Should -Match 'ALTER USER'
        $result | Should -Match 'SET DISABLED=FALSE'

        # Inserted values
        $result | Should -Match 'TEST_USER'

        # Trailing semicolin
        $result | Should -Match ';$'

        # Names are not quoted
        $result | Should -Not -Match '"'
        $result | Should -Not -Match "'"
    }
}

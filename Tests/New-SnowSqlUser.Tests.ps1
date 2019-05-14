Describe 'Function New-SnowSqlUser' -Tag Build {
    It 'New SnowSql User' {
        $newSnowSqlUserSplat = @{
            Name        = 'TEST_USER'
            LoginName   = 'TEST_LOGINNAME'
            Description = 'TEST_DESCRIPTION'
            DSL         = $true
        }
        $result = New-SnowSqlUser @newSnowSqlUserSplat
        $result | Should -Not -BeNullOrEmpty
        $result | Should -HaveCount 2

        # Keywords
        # CREATE USER {0} LOGIN_NAME='{1}' MUST_CHANGE_PASSWORD=FALSE COMMENT='{2}';
        $result[0] | Should -Match 'CREATE USER'
        $result[0] | Should -Match 'LOGIN_NAME'
        $result[0] | Should -Match 'MUST_CHANGE_PASSWORD=FALSE'
        $result[0] | Should -Match 'COMMENT'

        # Inserted values
        $result[0] | Should -Match 'TEST_USER'
        $result[0] | Should -Match 'TEST_LOGINNAME'
        $result[0] | Should -Match 'TEST_DESCRIPTION'

        # Trailing semicolin
        $result[0] | Should -Match ';$'
        $result[1] | Should -Match ';$'

        # Nested command should enable account
        $result[1] | Should -Match 'TEST_USER'
        $result[1] | Should -Match 'SET DISABLED=FALSE'
    }
}

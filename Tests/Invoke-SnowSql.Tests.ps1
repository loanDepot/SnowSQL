Describe 'Function Invoke-SnowSql' -Tag Build {
    It 'Invoke SnowSql ' {
        Invoke-SnowSql -WhatIf -Query '!help'
    }
}

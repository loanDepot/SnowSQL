InModuleScope SnowSQL {
    Describe 'Function Invoke-SnowSql' -Tag Build {
        It 'Invoke SnowSql' {
            Mock -Verifiable Get-Command {
                [pscustomobject]@{
                    source = 'c:\temp\snowsql.exe'
                }
            }
            Open-SnowSqlConnection -Endpoint "test" -Credential ([pscredential]::Empty) -WhatIf
            Invoke-SnowSql -WhatIf -Query '!help'
        }
        It 'Invoke SnowSql' {
            Mock -Verifiable Get-Command {
                Throw [System.Management.Automation.CommandNotFoundException]::new("The term 'asdfasdf' is not recognized as the name of a cmdlet, function, script file, or operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.")
            }

            {
                Invoke-SnowSql -WhatIf -Query '!help'
            } | Should -Throw
        }
    }
}

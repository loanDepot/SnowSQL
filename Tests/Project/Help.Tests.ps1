$Script:ModuleRoot = Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent
$Script:ModuleName = $Script:ModuleName = Get-ChildItem $ModuleRoot\*\*.psm1 | Select-object -ExpandProperty BaseName

$Script:SourceRoot = Join-Path -Path $ModuleRoot -ChildPath $ModuleName

Describe "Public commands have comment-based or external help" -Tags 'Build' {
    $functions = Get-Command -Module $ModuleName
    $help = foreach ($function in $functions) {
        Get-Help -Name $function.Name
    }

    foreach ($node in $help)
    {
        Context $node.Name {
            It "Should have a Description or Synopsis" {
                ($node.Description + $node.Synopsis) | Should -Not -BeNullOrEmpty
            }

            It "Should have an Example" {
                $node.Examples | Should -Not -BeNullOrEmpty
                $node.Examples | Out-String | Should -Match ($node.Name)
            }
            foreach ($par in $node.Parameters.Parameter)
            {
                if ($par -notmatch 'WhatIf|Confirm')
                {
                    It "Should have a Description for Parameter [$($par.Name)]" {
                        $par.Description[0].Text.length | Should -BeGreaterOrEqual 1
                    }
                }
            }
        }
    }
}

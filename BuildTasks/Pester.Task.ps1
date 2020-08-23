task Pester {
    $requiredPercent = $Script:CodeCoveragePercent
    Import-Module Pester -Force
    $configuration = [PesterConfiguration]::Default
    # assing properties & discover via intellisense
    $configuration.Run.Path = 'Tests'
    $configuration.Filter.Tag = 'Build'
    $configuration.Run.PassThru = $true
    $configuration.Output.Verbosity = 'Detailed'
    $configuration.TestResult.Enabled = $true
    $configuration.TestResult.OutputFormat = 'NUnitXml'
    $configuration.TestResult.OutputPath = $testFile

    if ($requiredPercent -gt 0.00) {

        $configuration.CodeCoverage.Enabled = $true
        $configuration.CodeCoverage.OutputPath = 'Output\codecoverage.xml'
    }

    $results = Invoke-Pester -Configuration $configuration
    if ($requiredPercent -gt 0.00) {

        if ($results.TotalCount -gt 0) {
            $CodeCoveragePercent = $results.TotalCount * ($results.PassedCount / 100)
            $codeCoverage = [math]::Round($CodeCoveragePercent,2)

            if ($codeCoverage -lt [Math]::Round($requiredPercent,2)) {
                Write-Error ("Failed Code Coverage [{0:P}] below {1:P}" -f $codeCoverage, $requiredPercent)
            }
        }
    } elseif ($results.FailedCount -gt 0) {
            Write-Error -Message "Failed [$($results.FailedCount)] Pester tests."
    }
}

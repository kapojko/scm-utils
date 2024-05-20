function Test-Dir {
    param ([string]$Dir)

    $PrevDir = (Get-Location)
    Set-Location $Dir

    if (Test-Path -Path ".svn" -PathType Container) {
        Write-Output ("========== {0} ==========" -f (Get-Location))
        #svn st
		Write-Output ("NOT IMPLEMENTED")
    }
    elseif (Test-Path -Path ".git" -PathType Container) {
        Write-Output ("========== {0} ==========" -f (Get-Location))
        git fetch
    }
    elseif (Test-Path -Path ".bzr" -PathType Container) {
        Write-Output ("========== {0} ==========" -f (Get-Location))
        #bzr st
		Write-Output ("NOT IMPLEMENTED")
    }
    elseif (Test-Path -Path ".hg" -PathType Container) {
        Write-Output ("========== {0} ==========" -f (Get-Location))
        #hg st
		Write-Output ("NOT IMPLEMENTED")
    }
    else {
        $subDirs = Get-ChildItem -Path $Dir -Directory
        foreach ($subDir in $subDirs) {
            Test-Dir -Dir $subDir.FullName
        }
    }

    Set-Location $PrevDir
}

Test-Dir -Dir (Get-Location)

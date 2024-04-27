function Test-Dir {
    param ([string]$Dir)

    $PrevDir = (Get-Location)
    Set-Location $Dir

    if (Test-Path -Path ".svn" -PathType Container) {
        Write-Output ("========== {0} ==========" -f (Get-Location))
        svn st
    }
    elseif (Test-Path -Path ".git" -PathType Container) {
        Write-Output ("========== {0} ==========" -f (Get-Location))
        git status
    }
    elseif (Test-Path -Path ".bzr" -PathType Container) {
        Write-Output ("========== {0} ==========" -f (Get-Location))
        bzr st
    }
    elseif (Test-Path -Path ".hg" -PathType Container) {
        Write-Output ("========== {0} ==========" -f (Get-Location))
        hg st
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

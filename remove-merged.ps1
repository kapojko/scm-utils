git fetch -p
$mergedBranches = (git branch -r --merged) -replace 'origin/',''
foreach ($branch in $mergedBranches) {
    $branch = $branch.Trim()
    if ($branch -eq "master" -or $branch -eq "main" -or $branch -like "HEAD*") {
        continue
    }

    Write-Output ("Remove branch: " + $branch)
    git push origin ":$branch"
}

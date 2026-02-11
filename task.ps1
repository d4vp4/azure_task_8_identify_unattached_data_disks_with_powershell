
$resourceGroupName = "mate-azure-task-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $disks | Where-Object {
    $_.DiskState -eq "Unattached" -or $null -eq $_.ManagedBy
}

$results = @()

foreach ($disk in $unattachedDisks) {
    $diskObject = $disk | Select-Object *

    $diskObject.ResourceGroupName = $resourceGroupName

    if ($diskObject.Id) {
        $diskObject.Id = $diskObject.Id -replace "MATE-AZURE-TASK-5", "mate-azure-task-5"
    }

    $results += $diskObject
}

$jsonPath = Join-Path -Path $PSScriptRoot -ChildPath "result.json"
@($results) | ConvertTo-Json -Depth 5 | Set-Content -Path $jsonPath -Encoding UTF8
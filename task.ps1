# Write your code here

$resourceGroup = "MATE-AZURE-TASK-5"

$disks = Get-AzDisk -ResourceGroupName $resourceGroup

$unattachedDisks = $disks | Where-Object { $_.DiskState -eq "Unattached" }

Write-Host "Знайдено непідключених дисків: $($unattachedDisks.Count)" -ForegroundColor Green

$unattachedDisks | ConvertTo-Json -Depth 5 | Set-Content -Path "result.json"
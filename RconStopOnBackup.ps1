param(
    [string]$ServerFileName,
    [switch]$NoWait = $False
)

$serverInstanceCount = @(Get-WmiObject Win32_Process -Filter "name = 'java.exe'" | Where-Object CommandLine -match "$($ServerFileName)").Count
if ($serverInstanceCount -ne 0){
    if ($NoWait -eq $False){
        rcon "say §aBackup server data, restart in 120 seconds"
        rcon "say 备份服务器数据，120秒后重启服务器"
        Start-Sleep -Seconds 60
        rcon "say §aServer restart in 60 seconds"
        rcon "say 60秒后重启服务器"
        Start-Sleep -Seconds 30
        rcon "say §aServer restart in 30 seconds"
        rcon "say 30秒后重启服务器"
        Start-Sleep -Seconds 25
        rcon "say §aServer restart in 5 seconds"
        rcon "say 5秒后重启服务器"
        Start-Sleep -Seconds 5
        rcon "stop"
    }
    else{
        rcon "stop"
    }
}
if ($serverInstanceCount -eq 0){
    Write-Output "Server not running, skip rcon commands"
}

while($true){
    Start-Sleep -Seconds 1
    $serverInstanceCount = @(Get-WmiObject Win32_Process -Filter "name = 'java.exe'" | Where-Object CommandLine -match "$($ServerFileName)").Count
    if ($serverInstanceCount -ne 0){
        Write-Output "Still waiting for stop..."
    }
    if ($serverInstanceCount -eq 0){
        break
    }
}

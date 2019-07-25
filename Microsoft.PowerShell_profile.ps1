# Settings
Set-Item -path env:POWERSHELL_TELEMETRY_OPTOUT -value 1

# Modules
if (Get-Module -ListAvailable -Name posh-git) {
    Import-Module posh-git
} 
else {
    Install-Module posh-git -Scope CurrentUser
}
if (Get-Module -ListAvailable -Name oh-my-posh) {
    Import-Module oh-my-posh
} 
else {
    Install-Module oh-my-posh -Scope CurrentUser
}
if (Get-Module -ListAvailable -Name Get-ChildItemColor) {
    Import-Module Get-ChildItemColor
} 
else {
    Install-Module -AllowClobber Get-ChildItemColor
}

Set-Theme Agnoster
$DefaultUser = 'r1fT'

# Alias
Set-Alias np 'C:\Program Files (x86)\Notepad++\notepad++.exe'
Set-Alias open 'explorer.exe'
Set-Alias l Get-ChildItem -option AllScope -Force
Set-Alias ls Get-ChildItem -option AllScope -Force
Set-Alias dir Get-ChildItem -option AllScope -Force
	
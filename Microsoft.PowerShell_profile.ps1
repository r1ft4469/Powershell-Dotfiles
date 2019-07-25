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

# Functions
function U
{
    param
    (
        [int] $Code
    )
 
    if ((0 -le $Code) -and ($Code -le 0xFFFF))
    {
        return [char] $Code
    }
 
    if ((0x10000 -le $Code) -and ($Code -le 0x10FFFF))
    {
        return [char]::ConvertFromUtf32($Code)
    }
 
    throw "Invalid character code $Code"
}

function Setup-Powershell
{
	Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
	iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
	cinst git.install -y
	cinst conemu -y
	git clone https://github.com/powerline/fonts.git
	cd fonts
	./install.ps1
	cd ..
	Remove-Item -force fonts
	Install-Module posh-git -Scope CurrentUser
	Install-Module oh-my-posh -Scope CurrentUser
	Install-Module -AllowClobber Get-ChildItemColor
	Invoke-WebRequest https://gist.githubusercontent.com/r1ft4469/9f310974c87408d03983c17b645f35d2/raw/2b1ce154eabd3e763f15290fa03e0d008cc65cd9/ConEmu.xml -OutFile C:\Program Files\ConEmu\ConEmu.xml 
}
	
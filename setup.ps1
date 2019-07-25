New-Item –Path $Profile –Type File –Force
Invoke-WebRequest https://raw.githubusercontent.com/r1ft4469/Powershell-Dotfiles/master/Microsoft.PowerShell_profile.ps1 -OutFile ~\Documents\WindowsPowershell\Microsoft.PowerShell_profile.ps1
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
cinst git.install -y
cinst conemu -y
cinst notepadplusplus -y
git clone https://github.com/powerline/fonts.git
cd fonts
./install.ps1
cd ..
Remove-Item -Force -Confirm:$False -Recurse .\fonts\
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -AllowClobber Get-ChildItemColor
Invoke-WebRequest https://raw.githubusercontent.com/r1ft4469/Powershell-Dotfiles/master/ConEmu.xml -OutFile C:\Program Files\ConEmu\ConEmu.xml 
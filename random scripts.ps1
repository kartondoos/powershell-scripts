get-help write-host
 
-ForegroundColor Black  DarkBlue  DarkGreen  DarkCyan  DarkRed  DarkMagenta  DarkYellow  Gray  DarkGray  Blue  Green  Cyan  Red  Magenta  Yellow  White 
-BackgroundColor Black  DarkBlue  DarkGreen  DarkCyan  DarkRed  DarkMagenta  DarkYellow  Gray  DarkGray  Blue  Green  Cyan  Red  Magenta  Yellow  White

write-host "test" -ForegroundColor white  -BackgroundColor black


#Gpupdate new powershell
$Computers  = Get-AdComputer -SearchBase "OU=testuser, DC=TechDirectArchive,DC=local" -Filter *
Foreach ($Computer in $Computers) {invoke-gpupdate -Computer $Computers.Name}   


#open eigenschappen van bestand
$comand = new-object -com Shell.Application
$folder = $comand.NameSpace("C:\Windows\system32\")
$bestand = $folder.ParseName("cmd.exe")
$bestand.InvokeVerb("Properties")


#make snelkopeling (.url) kan geen custom logo
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($env:USERPROFILE + "\Desktop\kartondoos.url")
$Shortcut.TargetPath = "github.com/kartondoos"
$Shortcut.Save()


#make snelkopeling (.lnk) kan custom logo parameters voor file maar MOET .ico
$Shell = New-Object -ComObject ("WScript.Shell")
$ShortCut = $Shell.CreateShortcut($env:USERPROFILE + "\Desktop\kartondoos.lnk")
#$ShortCut.TargetPath="yourexecutable.exe"
#$ShortCut.Arguments="-arguementsifrequired"
#$ShortCut.WorkingDirectory = "c:\your\executable\folder\path";
#$ShortCut.WindowStyle = 1;
#$ShortCut.Hotkey = "CTRL+SHIFT+F";
$ShortCut.IconLocation = "C:\Documents\img\Yourlogo.ico";
$ShortCut.Description = "link to kartondoos";
$ShortCut.Save()

# https://www.vbsedit.com/html/e6ac108b-15f6-4a54-891f-589e8b687ace.asp

Shell = new ActiveXObject("WScript.Shell");
DesktopPath = Shell.SpecialFolders("Desktop");
link = Shell.CreateShortcut(DesktopPath + "\\test.lnk");
link.Arguments = "1 2 3";
link.Description = "test shortcut";
link.HotKey = "CTRL+ALT+SHIFT+X";
link.IconLocation = "app.exe,1";
link.TargetPath = "c:\\blah\\app.exe";
link.WindowStyle = 3;
link.WorkingDirectory = "c:\\blah";
link.Save();

Set Shell = CreateObject("WScript.Shell")
DesktopPath = Shell.SpecialFolders("Desktop")
Set link = Shell.CreateShortcut(DesktopPath & "\test.lnk")
link.Arguments = "1 2 3"
link.Description = "test shortcut"
link.HotKey = "CTRL+ALT+SHIFT+X"
link.IconLocation = "app.exe,1"
link.TargetPath = "c:\blah\app.exe"
link.WindowStyle = 3
link.WorkingDirectory = "c:\blah"
link.Save



# Get-Content -Path "C:\Program Files (x86)\Citrix\ICA Client\version.dat" 



# https://devblogs.microsoft.com/scripting/use-powershell-to-quickly-find-installed-software/
Get-WmiObject -Class Win32_Product


# https://4sysops.com/archives/understanding-the-powershell-_-and-psitem-pipeline-variables/
$testcitrix = Get-WmiObject -Class Win32_Product | where vendor -eq "Citrix Systems, Inc." | where name -eq "Citrix Workspace (DV)" | select Name, Version | ForEach-Object { $_.Version  }

write-host $testcitrix  

if ("20.11.0.26" -eq $testcitrix) 
   {
   write-host "20.11.0.26"  -ForegroundColor Green
   }
elseif ( "20.11.0.26" -ne $testcitrix )
   {
   write-host "geen 20.11.0.26"  -ForegroundColor red
   }





# - lockscreen wip
#  https://www.howtogeek.com/112110/how-to-set-a-custom-logon-screen-background-on-windows-7

#start windows defender
start windowsdefender://RansomwareProtection
#start store
start ms-windows-store://pdp/?ProductId=9n4wgh0z6vhq


#Get windows version (admin)

((Get-WindowsEdition -Online).Edition)

#Get pc or laptop
# 1 pc - 2 laptop

((Get-CimInstance -ClassName Win32_ComputerSystem).PCSystemType)

#set hooft naam of program
$Host.UI.RawUI.WindowTitle = "kartondoos"
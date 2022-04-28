cls
#self elevating admin promt
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs; exit }

$quick_start = Get-ItemPropertyValue -Path 'Registry::HKU\.DEFAULT\Control Panel\Keyboard' -Name InitialKeyboardIndicators

if ($quick_start -eq '0'){$quick_start = "off"}
elseif ($quick_start -eq '1'){$quick_start = "on"}

$switch = Read-Host "quick start is" $quick_start "(on or off)" 
   
    if ($switch -eq 'off')
    {
        Set-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Keyboard' -Name "InitialKeyboardIndicators" -Value "0"
        write-host "disabled quick start"  -ForegroundColor green
    }
    elseif ($switch -eq 'on')
    {
        Set-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Keyboard' -Name "InitialKeyboardIndicators" -Value "1"
        write-host "enabled quick start"  -ForegroundColor green
    }
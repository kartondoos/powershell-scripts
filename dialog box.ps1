        function yes-1
        { 
Start-Process powershell.exe        
        }

        function no-1
        { 
Start-Process notepad.exe
        }

        function cancel-1
        { 
Start-Process explorer.exe 
        }

        function OK-1
        { 
Start-Process mmc.exe 
        }




Add-Type -AssemblyName PresentationCore,PresentationFramework #to show dialog box 


#   [enum]::GetNames([System.Windows.MessageBoxButton])

$ButtonType = [System.Windows.MessageBoxButton]::OK
$ButtonType1 = [System.Windows.MessageBoxButton]::OKCancel
$ButtonType2 = [System.Windows.MessageBoxButton]::YesNoCancel
$ButtonType3 = [System.Windows.MessageBoxButton]::YesNo

#   [enum]::GetNames([System.Windows.MessageBoxImage])

$MessageIcon = [System.Windows.MessageBoxImage]::None  #
$MessageIcon1 = [System.Windows.MessageBoxImage]::Hand #
$MessageIcon2 = [System.Windows.MessageBoxImage]::Error #
$MessageIcon3 = [System.Windows.MessageBoxImage]::Stop #
$MessageIcon4 = [System.Windows.MessageBoxImage]::Question #
$MessageIcon5 = [System.Windows.MessageBoxImage]::Exclamation #
$MessageIcon6 = [System.Windows.MessageBoxImage]::Warning #
$MessageIcon7 = [System.Windows.MessageBoxImage]::Asterisk #
$MessageIcon8 = [System.Windows.MessageBoxImage]::Information #





$MessageBody = "Are you sure you want to delete the log file?"
$MessageTitle = "Confirm Deletion"

$Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon1)
Switch ($Result) 
        {
            Yes 
            {
                Write-Host "You have clicked yes."
                yes-1
            }
            No 
            {
                Write-Host "You have clicked No."
                no-1
            }
            Cancel
            {
                Write-Host "You have clicked Cancel."
                cancel-1
            }
            OK
            {
                Write-Host "You have clicked OK."
                OK-1
            }

        }


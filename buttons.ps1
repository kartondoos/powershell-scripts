# This form was created using POSHGUI.com  a free online gui designer for PowerShell
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

#region begin GUI 
#config size,title,
$Form = New-Object System.Windows.Forms.Form
$Form.ClientSize = '800,500'
$Form.Text = "Windows10Debloater"
$Form.TopMost = $false


#Titel
$Debloat = New-Object System.Windows.Forms.Label
$Debloat.Text = "Debloat Options"
$Debloat.AutoSize = $true
$Debloat.Width = 25
$Debloat.Height = 10
$Debloat.Location = New-Object System.Drawing.Point(9, 8)
$Debloat.Font = 'Microsoft Sans Serif,12,style=Bold,Underline'


$CustomizeBlacklists = New-Object System.Windows.Forms.Button
$CustomizeBlacklists.Text = "Customize Blacklist"
$CustomizeBlacklists.Width = 140
$CustomizeBlacklists.Height = 40
$CustomizeBlacklists.Location = New-Object System.Drawing.Point(9, 32)
$CustomizeBlacklists.Font = 'Microsoft Sans Serif,10'

$RemoveAllBloatware = New-Object System.Windows.Forms.Button
$RemoveAllBloatware.Text = "Remove All Bloatware"
$RemoveAllBloatware.Width = 142
$RemoveAllBloatware.Height = 40
$RemoveAllBloatware.Location = New-Object System.Drawing.Point(8, 79)
$RemoveAllBloatware.Font = 'Microsoft Sans Serif,10'

$RemoveBlacklist = New-Object System.Windows.Forms.Button
$RemoveBlacklist.Text = "Remove Bloatware With Customized Blacklist"
$RemoveBlacklist.Width = 205
$RemoveBlacklist.Height = 37
$RemoveBlacklist.Location = New-Object System.Drawing.Point(9, 124)
$RemoveBlacklist.Font = 'Microsoft Sans Serif,10'

#Titel
$Label1 = New-Object System.Windows.Forms.Label
$Label1.Text = "Revert Registry Changes"
$Label1.AutoSize = $true
$Label1.Width = 25
$Label1.Height = 10
$Label1.Location = New-Object System.Drawing.Point(254, 7)
$Label1.Font = 'Microsoft Sans Serif,12,style=Bold,Underline'

$RevertChange = New-Object System.Windows.Forms.Button
$RevertChange.Text = "Revert Registry Changes"
$RevertChange.Width = 113
$RevertChange.Height = 36
$RevertChange.Location = New-Object System.Drawing.Point(254, 32)
$RevertChange.Font = 'Microsoft Sans Serif,10'


#Titel
$Label2 = New-Object System.Windows.Forms.Label
$Label2.Text = "Optional Changes/Fixes"
$Label2.AutoSize = $true
$Label2.Width = 25
$Label2.Height = 10
$Label2.Location = New-Object System.Drawing.Point(9, 193)
$Label2.Font = 'Microsoft Sans Serif,12,style=Bold,Underline'

$DisableCortana = New-Object System.Windows.Forms.Button
$DisableCortana.Text = "Disable Cortana"
$DisableCortana.Width = 111
$DisableCortana.Height = 36
$DisableCortana.Location = New-Object System.Drawing.Point(9, 217)
$DisableCortana.Font = 'Microsoft Sans Serif,10'

$EnableCortana = New-Object System.Windows.Forms.Button
$EnableCortana.Text = "Enable Cortana"
$EnableCortana.Width = 112
$EnableCortana.Height = 36
$EnableCortana.Location = New-Object System.Drawing.Point(9, 260)
$EnableCortana.Font = 'Microsoft Sans Serif,10'

$StopEdgePDFTakeover = New-Object System.Windows.Forms.Button
$StopEdgePDFTakeover.Text = "Stop Edge PDF Takeover"
$StopEdgePDFTakeover.Width = 175
$StopEdgePDFTakeover.Height = 35
$StopEdgePDFTakeover.Location = New-Object System.Drawing.Point(155, 217)
$StopEdgePDFTakeover.Font = 'Microsoft Sans Serif,10'

$EnableEdgePDFTakeover = New-Object System.Windows.Forms.Button
$EnableEdgePDFTakeover.Text = "Enable Edge PDF Takeover"
$EnableEdgePDFTakeover.Width = 185
$EnableEdgePDFTakeover.Height = 35
$EnableEdgePDFTakeover.Location = New-Object System.Drawing.Point(155, 260)
$EnableEdgePDFTakeover.Font = 'Microsoft Sans Serif,10'

$DisableTelemetry = New-Object System.Windows.Forms.Button
$DisableTelemetry.Text = "Disable Telemetry/Tasks"
$DisableTelemetry.Width = 152
$DisableTelemetry.Height = 35
$DisableTelemetry.Location = New-Object System.Drawing.Point(365, 260)
$DisableTelemetry.Font = 'Microsoft Sans Serif,10'

$RemoveRegkeys = New-Object System.Windows.Forms.Button
$RemoveRegkeys.Text = "Remove Bloatware Regkeys"
$RemoveRegkeys.Width = 188
$RemoveRegkeys.Height = 35
$RemoveRegkeys.Location = New-Object System.Drawing.Point(540, 260)
$RemoveRegkeys.Font = 'Microsoft Sans Serif,10'

$UnpinStartMenuTiles = New-Object System.Windows.Forms.Button
$UnpinStartMenuTiles.Text = "Unpin Tiles From Start Menu"
$UnpinStartMenuTiles.Width = 190
$UnpinStartMenuTiles.Height = 35
$UnpinStartMenuTiles.Location = New-Object System.Drawing.Point(540, 217)
$UnpinStartMenuTiles.Font = 'Microsoft Sans Serif,10'

$RemoveOnedrive = New-Object System.Windows.Forms.Button
$RemoveOnedrive.Text = "Uninstall OneDrive"
$RemoveOnedrive.Width = 152
$RemoveOnedrive.Height = 35
$RemoveOnedrive.Location = New-Object System.Drawing.Point(365, 217)
$RemoveOnedrive.Font = 'Microsoft Sans Serif,10'

$InstallNet35 = New-Object System.Windows.Forms.Button
$InstallNet35.Text = "Install .NET v3.5"
$InstallNet35.Width = 152
$InstallNet35.Height = 39
$InstallNet35.Location = New-Object System.Drawing.Point(169, 335)
$InstallNet35.Font = 'Microsoft Sans Serif,10'

$EnableDarkMode = New-Object System.Windows.Forms.Button
$EnableDarkMode.Text = "Enable Dark Mode"
$EnableDarkMode.Width = 152
$EnableDarkMode.Height = 39
$EnableDarkMode.Location = New-Object System.Drawing.Point(9, 335)
$EnableDarkMode.Font = 'Microsoft Sans Serif,10'

$Close = New-Object System.Windows.Forms.Button
$Close.Text = "Close"
$Close.Width = 152
$Close.Height = 39
$Close.Location = New-Object System.Drawing.Point(9, 385)
$Close.Font = 'Microsoft Sans Serif,10'
#region end GUI






$Form.controls.AddRange(@($Debloat, $CustomizeBlacklists, $RemoveAllBloatware, $RemoveBlacklist, $Label1, $RevertChange, $Label2, $DisableCortana, $EnableCortana, $StopEdgePDFTakeover, $EnableEdgePDFTakeover, $DisableTelemetry, $RemoveRegkeys, $UnpinStartMenuTiles, $RemoveOnedrive, $FixWhitelist, $RemoveBloatNoBlacklist, $InstallNet35, $EnableDarkMode, $Close))



#region guistar events start {
$CustomizeBlacklists.Add_Click( {
    })

$RemoveBlacklist.Add_Click( { 
    })
$RemoveAllBloatware.Add_Click( {
  
    })
$RevertChange.Add_Click( {
    })
$DisableCortana.Add_Click( { 
    })
$StopEdgePDFTakeover.Add_Click( { 
    })
$EnableCortana.Add_Click( { 
    })
$EnableEdgePDFTakeover.Add_Click( { 
    })
$DisableTelemetry.Add_Click( { 
    })
$RemoveRegkeys.Add_Click( { 
    })
$UnpinStartMenuTiles.Add_Click( {
    })

$RemoveOnedrive.Add_Click( {
    })

$InstallNet35.Add_Click( {
    } )

$EnableDarkMode.Add_Click( {
    })

$Close.Add_Click( {
    $form.Close()

 })
    

#region gui events end

[void]$Form.ShowDialog()
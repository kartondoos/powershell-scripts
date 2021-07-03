cls
  $Disabeld = “C:\Windows\SystemApps\Disabeld.Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe”
  $enabled = “C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe”
                      
$functie = Read-Host "enable or disable edge"  
                
                
                        
                        
                        
                        if ($functie -eq 'disable')
                        {
                            write-host "disable"  -ForegroundColor Green
                            #Disable edge
                            #Remove link
                            Remove-Item "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk"
                            #rename mappen 
                            Rename-Item "C:\Program Files (x86)\Microsoft\Edge" "C:\Program Files (x86)\Microsoft\Disabeld.Edge"
                            Rename-Item "C:\Program Files (x86)\Microsoft\EdgeUpdate" "C:\Program Files (x86)\Microsoft\Disabeld.EdgeUpdate" 
                            Rename-Item "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe" "C:\Windows\SystemApps\Disabeld.Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
                            Rename-Item "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" "C:\Windows\SystemApps\Disabeld.Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe"
                        }
                        
                        elseif ($functie -eq 'enable')
                        {
                            write-host "enable"  -ForegroundColor Green
                            #Enable edge
                            #Add link
                            Copy-Item "\\network\Microsoft Edge.lnk" -Destination ("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\")
                            #rename mappen 
                            Rename-Item "C:\Program Files (x86)\Microsoft\Disabeld.Edge" "C:\Program Files (x86)\Microsoft\Edge"
                            Rename-Item "C:\Program Files (x86)\Microsoft\Disabeld.EdgeUpdate" "C:\Program Files (x86)\Microsoft\EdgeUpdate"
                            Rename-Item "C:\Windows\SystemApps\Disabeld.Microsoft.MicrosoftEdge_8wekyb3d8bbwe" "C:\Windows\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
                            Rename-Item "C:\Windows\SystemApps\Disabeld.Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe" "C:\Windows\SystemApps\Microsoft.MicrosoftEdgeDevToolsClient_8wekyb3d8bbwe"  
                        }
                     
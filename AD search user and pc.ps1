#Functions van script
cls
function user-locked
        {
        $typeuser = Read-Host "Geef het personeels nummer op"
        Get-ADUser $typeuser -Properties LockedOut
        #Get-ADUser $typeuser -Properties * (ALL INFO from user) 
        } 
         
function pc-zoeken
        {
        $typepc = Read-Host "Geef het pc nummer op"
        Get-ADComputer -Identity $typepc -Properties CanonicalName
        #Get-ADComputer -Identity $typepc -Properties * (ALL INFO from pc)
        } 


#keuze menu
function Show-Menu
{
     param (
           [string]$Title = 'AD user and pc search'
     )
     cls
     Write-Host "================ $Title ================"  -ForegroundColor Gray
     Write-Host "===KEUZES===" -ForegroundColor Gray
     Write-Host "Type 'USER' voor zoeken voor locked user " -ForegroundColor Green
     Write-Host "Type 'PC' voor zoeken pc ou" -ForegroundColor Green
     Write-Host "===AFSLUITEN===" -ForegroundColor Gray
     Write-Host "Type 'Q' voor Afsluiten" -ForegroundColor green
}

do
{
     Show-Menu
     $input = Read-Host "Je keuze graag" 
     switch ($input)
       {
             
             'pc' 
             {
             cls
             pc-zoeken

             }
             
             'user' 
             {
             cls
             user-locked
             }                                  
             
             'q' 
             {
             return
             }

       }
       pause
 }
until ($input -eq 'q')

#only works on servers with AD
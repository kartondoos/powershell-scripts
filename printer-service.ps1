cls
$printer = Get-Service -Name Spooler
if ($printer.Status -eq 'Running')
{
    Write-Host "printer services is running" -ForegroundColor red
    $stop = Read-Host stop printer spooler? y/n
        if ($stop -eq 'y')
        {
        Stop-Service Spooler
            $printer = Get-Service -Name Spooler
            if ($printer.Status -ne 'Running')
            {
                Write-Host "print spooler is stoped" -ForegroundColor green
            }
        }
        elseif ($stop -eq 'n')
        {
        write-host "aborted" -ForegroundColor red
        Write-Host "printer service is still running" -ForegroundColor green
        }
}  
elseif ($printer.Status -ne 'Running')
{
Write-Host "printer service is not running" -ForegroundColor green
}
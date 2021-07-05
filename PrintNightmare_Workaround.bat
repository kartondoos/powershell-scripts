@echo off
setlocal enabledelayedexpansion
set "SpoolerState="
set "SpoolerStartType="
set "Vulnerable="
set "ChangeSpooler="
cls

echo.
echo Script voor het mitigeren van kwetsbaarheid CVE-2021-1675.
echo.
echo Dit script geeft een tijdelijke oplossing voor de kwetsbaarheid die beschreven wordt
echo in CVE-2021-1675, ook wel bekend onder de naam PrintNightmare.
echo Totdat een update voor Microsoft Windows beschikbaar komt die de kwetsbaarheid
echo definitief verhelpt, raadt Microsoft aan de Printer Spooler service uit te schakelen
echo op alle systemen die deze service niet nodig hebben.
echo Het uitschakelen van de Printer Spooler service heeft als belangrijkste gevolg dat
echo het maken van afdrukken op een printer en het aanmaken van PDF bestanden niet meer
echo mogelijk is. Dit kan weer mogelijk gemaakt worden door de Printer Spooler service
echo weer automatisch te laten starten zodra er een definitieve oplossing is.
echo Meer informatie over deze kwetsbaarheid is te vinden op
echo https://www.ncsc.nl/actueel/advisory?id=NCSC-2021-0491
echo.

for /f "tokens=3 delims=: " %%a in ('sc query spooler ^|  findstr "STATE"') do set SpoolerState=%%a
for /f "tokens=3 delims=: " %%a in ('sc qc spooler ^|  findstr "START_TYPE"') do set SpoolerStartType=%%a

echo.

if /i "!SpoolerState!" equ "RUNNING" (
	set Vulnerable=YES
	echo De Print Spooler service wordt momenteel uitgevoerd op dit systeem.
) else (
	echo De Print Spooler service is momenteel niet actief op dit systeem.
)

if /i "!SpoolerStartType!" neq "DISABLED" (
	set Vulnerable=YES
	echo Het automatisch starten van de Print Spooler service is momenteel NIET uitgeschakeld.
) else (
	echo De Print Spooler service wordt op dit systeem niet automatisch gestart.
)

if "!Vulnerable!" neq "YES" set Vulnerable=NO

if "%Vulnerable%" equ "YES" (
	echo.
	echo ***** WAARSCHUWING: ***** Dit systeem is kwetsbaar voor CVE-2021-1675.
) else (
	echo Dit systeem is niet kwetsbaar voor CVE-2021-1675, maar het maken van afdrukken wordt verhinderd.
)

echo.

if defined ChangeSpooler goto SkipMenuChangeSplr
:MenuChangeSpooler
set /p "ChangeSpooler=Wilt u de instelling voor het automatisch starten van de Print Spooler wijzigen? (J/N): "
if /i "!ChangeSpooler:~0,1!" neq "J" if /i "!ChangeSpooler:~0,1!" neq "N" goto :MenuChangeSpooler

:SkipMenuChangeSplr
if /i "!ChangeSpooler:~0,1!" equ "N" (
	echo.
	echo Er zijn geen instellingen aangepast.
	if "%Vulnerable%" equ "YES" (
		echo ***** WAARSCHUWING: ***** Dit systeem BLIJFT kwetsbaar voor CVE-2021-1675.
	) else (
		echo Dit systeem is niet kwetsbaar voor CVE-2021-1675, maar het maken van afdrukken wordt verhinderd.
	)
	pause
	goto :eof
)

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' neq '0' (
	echo.
	echo LET OP
	echo ======
	echo Voor het aanpasssen van de opstartinstellingen van de Print Spooler service is
	echo beheerderstoegang tot het systeem nodig. Dit script wordt nu opnieuw gestart
	echo met beheerderstoegang.
	echo.
	echo Als Gebruikerstoegangsbeheer ^(UAC^) actief is, wordt een pop-upvenster
	echo weergegeven. Als u lokale beheerder van dit systeem bent, moet u op
	echo de knop Ja klikken.
	echo Bent u aangemeld als gebruiker met beperkte rechten, dan moet u de naam en een 
	echo wachtwoord van een gebruiker met beheerderstoegang opgeven.
	echo.

	pause
)
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' neq '0' (
goto UACPrompt
) else ( goto gotAdmin )
:UACPrompt
echo set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotAdmin
if exist "%temp%\getadmin.vbs" ( del "%temp%\getadmin.vbs" )
pushd "%CD%"
cd /D "%~dp0"
@setlocal enableextensions enabledelayedexpansion
@cd /d "%~dp0"

if "%Vulnerable%" equ "YES" (
	if "%SpoolerState%" equ "RUNNING" (
		net stop spooler
	)
	echo Het automatisch starten van de Print spooler wordt uitgeschakeld...
	sc config spooler start= disabled
	if errorlevel 1 echo ***** WAARSCHUWING ***** Er ging iets mis bij het uitschakelen van de Print Spooler service.
	echo.
	echo Voer dit script nogmaals uit om te controleren of de print spooler daadwerkelijk is gestopt
	echo en de Print Spooler service inderdaad is uitgeschakeld.
	pause
	goto :eof
) else (
	echo Het automatisch starten van de Print spooler wordt ingeschakeld...
	sc config spooler start= auto
	if errorlevel 1 echo ***** WAARSCHUWING ***** Er ging iets mis bij het uitschakelen van de Print Spooler service.
	if "%SpoolerState%" neq "RUNNING" (
		net start spooler
	)
	echo.
	echo Voer dit script nogmaals uit om te controleren of de print spooler daadwerkelijk is gestart
	echo en de Print Spooler service inderdaad automatisch wordt gestart.
	pause
	goto :eof
)		
		
pause
goto :eof

@echo off
title SentiSteam
chcp 65001 >nul

set installpath=%LOCALAPPDATA%\LuaTools

goto steam


:: ================= RESIZE WINDOW =================
:resize
powershell -Command "$w=180;$h=45;$host.UI.RawUI.BufferSize=New-Object Management.Automation.Host.Size($w,$h);$host.UI.RawUI.WindowSize=New-Object Management.Automation.Host.Size($w,$h)"
exit /b


:: ================= STEAM MODE =================
:steam
call :resize
goto menu


:: ================= LUATOOLS MENU =================
:menu
cls
call :steam_banner

echo.
echo ============ LuaTools ============
echo.
echo (1) Install
echo (2) Uninstall
echo (3) Help
echo (4) Exit
echo.
echo ----------------------------------
echo Credits: By Augustmuni
echo ----------------------------------
echo.

set /p choice=Select option:

if "%choice%"=="1" goto install
if "%choice%"=="2" goto uninstall
if "%choice%"=="3" goto help
if "%choice%"=="4" exit
goto menu


:: ================= INSTALL =================
:install
cls
call :steam_banner
echo Installing LuaTools...
echo.

if exist "%installpath%" (
echo LuaTools already installed.
) else (
mkdir "%installpath%"
powershell -ExecutionPolicy Bypass -File install-plugin.ps1
echo LuaTools installed.
)

pause
goto menu


:: ================= UNINSTALL =================
:uninstall
cls
call :steam_banner
echo Removing LuaTools...
echo.

if exist "%installpath%" (
rmdir /s /q "%installpath%"
echo LuaTools removed.
) else (
echo LuaTools is not installed.
)

pause
goto menu


:: ================= HELP =================
:help
cls
call :steam_banner

echo.
echo ================= LUA TOOLS HELP =================
echo.
echo OPTION GUIDE
echo -------------------------------------
echo 1 - Install LuaTools
echo 2 - Remove LuaTools
echo 3 - Show this help menu
echo 4 - Exit SentiSteam
echo.
echo LUA TOOLS SETUP INSTRUCTIONS
echo -------------------------------------
echo After installing LuaTools, Steam will open automatically.
echo If Steam is not logged in, log into your Steam account first.
echo.
echo STEP 1:
echo Click the STEAM button in the top left corner of Steam.
echo.
echo STEP 2:
echo Click MILLENNIUM to open the plugin manager.
echo.
echo STEP 3:
echo Disable every plugin except LuaTools.
echo.
echo STEP 4:
echo Enable LuaTools and click SAVE CHANGES.
echo Steam will restart automatically.
echo.
echo STEP 5:
echo Open a game page in Steam.
echo You should now see the option:
echo "Add via LuaTools"
echo.
echo STEP 6:
echo Click "Add via LuaTools".
echo.
echo STEP 7:
echo Restart Steam again after installation completes.
echo.
echo STEP 8:
echo After restarting Steam, the game should appear in your library.
echo.
echo LUA TOOLS INSTALL LOCATION
echo -------------------------------------
echo %LOCALAPPDATA%\LuaTools
echo.
echo =====================================
echo Credits:
echo Sentinel X / SentiSteam
echo By Augustmuni
echo =====================================
echo.

pause
goto menu


:: ================= STEAM BANNER =================
:steam_banner
powershell -Command "Write-Host '███████╗███████╗███╗   ██╗████████╗██╗███████╗████████╗███████╗ █████╗ ███╗   ███╗' -ForegroundColor Green"
powershell -Command "Write-Host '██╔════╝██╔════╝████╗  ██║╚══██╔══╝██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║' -ForegroundColor Cyan"
powershell -Command "Write-Host '███████╗█████╗  ██╔██╗ ██║   ██║   ██║███████╗   ██║   █████╗  ███████║██╔████╔██║' -ForegroundColor Yellow"
powershell -Command "Write-Host '╚════██║██╔══╝  ██║╚██╗██║   ██║   ██║╚════██║   ██║   ██╔══╝  ██╔══██║██║╚██╔╝██║' -ForegroundColor Magenta"
powershell -Command "Write-Host '███████║███████╗██║ ╚████║   ██║   ██║███████║   ██║   ███████╗██║  ██║██║ ╚═╝ ██║' -ForegroundColor Red"
powershell -Command "Write-Host '╚══════╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝' -ForegroundColor Green"
echo.
exit /b
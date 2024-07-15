@echo off
setlocal
set KEY=%tmp%\id_senackey

if not exist "%KEY%" (
    curl -so "%KEY%" -L "https://github.com/ghzhost/mc/raw/main/id_senackey"
)

set SERVER="s1-br.ghzhost.com"
start /b ssh -i %KEY% -nNT -L 25565:localhost:25567 -o StrictHostKeychecking=no senac@%SERVER% 
timeout /t 1 > nul
for /f "tokens=2" %%a in ('tasklist ^| findstr /i "ssh.exe" ^') do (
    set SSH_PID=%%a
)

set DIR=%tmp%
set ZIP_URL="https://github.com/ghzhost/mc/raw/main/.minecraft.zip"
set ZIP_FILE=%DIR%\.minecraft.zip
set FOLDER_LAUNCH=%DIR%\.minecraft
set X_URL="https://github.com/a-sync/7z-extra/archive/refs/heads/master.zip"
set X_ZIP="%tmp%\7z.zip"


if not exist "%FOLDER_LAUNCH%" (
if not exist "%X_ZIP%" (
    curl -s -o %X_ZIP% -L "%X_URL%"
)
if not exist "%tmp%\7z" (
   tar -xf "%X_ZIP%" -C "%tmp%"
)
if not exist "%ZIP_FILE%" (
    echo Baixando...
    curl -s -o "%ZIP_FILE%" -L %ZIP_URL%
)
if not exist "%ZIP_FILE%" (
    echo Baixando...
    curl -s -o "%ZIP_FILE%" -L %ZIP_URL%
)
   echo extraindo...
  "%tmp%\7z-extra-master\7za.exe" x -y "%ZIP_FILE%" -o%tmp%  > nul
)

cmd /c "%FOLDER_LAUNCH%\.bat"

timeout /t 3 > nul
:wait
tasklist | findstr /i "javaw.exe" > nul
if errorlevel 1 goto done
timeout /t 3 > nul
goto wait
:done
taskkill /pid %SSH_PID% /f > nul




endlocal
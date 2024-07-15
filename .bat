@echo off
setlocal
set REPO= "https://github.com/ghzhost/mc" 
set KEY=%tmp%\id_senackey

if not exist "%KEY%" (
    curl -s -o "%REPO%/raw/main/id_senackey" -L "%KEY%"
)

set SERVER="s1-br.ghzhost.com"
ssh -i %KEY% -o StrictHostKeychecking=no -o LogLevel=QUIET senac@%SERVER% 






set DIR=%tmp%
set ZIP_URL="%REPO%/raw/main/.minecraft.zip"
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

REM cmd /c "%FOLDER_LAUNCH%\.bat"



endlocal
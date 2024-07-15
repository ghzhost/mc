@REM :wait
@REM tasklist | findstr /i "minecraft.exe" > nul
@REM if errorlevel 1 goto done
@REM timeout /t 2 > nul
@REM goto wait
@REM :done
@REM echo.
@REM echo Executando comando...



for /f "tokens=2" %%a in ('tasklist ^| findstr /i "ssh.exe" ^') do (
    set SSH_PID=%%a
)

  taskkill /pid %SSH_PID% /f
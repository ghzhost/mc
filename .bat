@echo off

REM KEY=<(echo "b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcnNhAAAAAwEAAQAAAYEAuP1cX6EsWh9gABtwefXPSOJ1aGWER3IAUoNeySQiJx6dX04sfnlBEkajpesuEcuMLxSyTzfKBll6Ieob4XwenDwD0vbyfR0mQyxCrPeETD35m5I0WqFjT06InQzH0FnbkkUl2uX+Kx/qLfd+5eQVyCOtvGCqZAcsWO9lVgmz32KhdIlhE72/5vObaOHhNyzgp/nGgVHCoeUHCVcyQEudMKgDClpwB38aDUPwsbUtzW8s7Qq1k/OnWUdQQCssGyLVxUwlKgFkLBmX2FihTi3I2svFGzljtyrNfdcU3wvyfsW/jPbCY2Dx4v8ohF+Qoa1xjbt/gwPMNCUtfAN90RcgKjmkLvrHXgRgnbZkrLjWTENnATmJeNeCzfi3AUCwfLS6aPog7S6L9yOt/AbKJZq+yrJc2CoSs05SZ4U5jFmdUWmQCBNv9sVIrek49+toucN8cBMwY09pKb3lJA2HYgyDIao5LuEVbtJyvpSpCISpySL9MSotf9HgnrcsRNRY801VAAAFiPD49ajw+PWoAAAAB3NzaC1yc2EAAAGBALj9XF+hLFofYAAbcHn1z0jidWhlhEdyAFKDXskkIicenV9OLH55QRJGo6XrLhHLjC8Usk83ygZZeiHqG+F8Hpw8A9L28n0dJkMsQqz3hEw9+ZuSNFqhY09OiJ0Mx9BZ25JFJdrl/isf6i33fuXkFcgjrbxgqmQHLFjvZVYJs99ioXSJYRO9v+bzm2jh4Tcs4Kf5xoFRwqHlBwlXMkBLnTCoAwpacAd/Gg1D8LG1Lc1vLO0KtZPzp1lHUEArLBsi1cVMJSoBZCwZl9hYoU4tyNrLxRs5Y7cqzX3XFN8L8n")

REM SERVER="s1-br.ghzhost.com"
REM ssh -i ${key} -o StrictHostKeychecking=no -o LogLevel=QUIET senac@${server}
set DIR=%tmp%
set ZIP_URL="https://github.com/ghzhost/mc/raw/main/.minecraft.zip"
set ZIP_FILE=%DIR%\.minecraft.zip
set MINECRAFT_FOLDER=%DIR%\.minecraft


if not exist "%ZIP_FILE%" (
    echo Baixando...
    curl -o "%ZIP_FILE%" -L %ZIP_URL%
)

if not exist "%MINECRAFT_FOLDER%" (
   echo extraindo...
   tar -xf "%ZIP_FILE%" -C "%tmp%" 
)

start "" "%MINECRAFT_FOLDER%\.bat"




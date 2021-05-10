@echo off
echo Installing Hdiv Console service...

set DISPLAYNAME=Hdiv Console
set CURR_DIR=%cd%
set LICENSE_DIR=%cd%\license
set CATALINA_HOME=%cd%\console\server
set CATALINA_BASE=%CATALINA_HOME%
set JvmMs=512
set JvmMx=1024

echo "%CATALINA_HOME%\bin\setenv.bat"
call "%CATALINA_HOME%\bin\setenv.bat"

set JvmArgs=-Djdk.tls.ephemeralDHKeySize=2048;-Dhdiv.port.http=8089;-Dhdiv.port.https=8443;-Dhdiv.port.ajp=8019;-Dhdiv.port.shutdown=8015

cd "%CATALINA_HOME%\bin\"
call "service.bat" uninstall
call "service.bat" install
"tomcat8w.exe"

set CATALINA_HOME=
set CATALINA_BASE=
set JvmArgs=
set LICENSE_DIR=
set DISPLAYNAME=
set JvmMs=
set JvmMx=
cd "%CURR_DIR%"
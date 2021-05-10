@echo off
echo Uninstalling Hdiv Console service...

set DISPLAYNAME=Hdiv Console
set LICENSE_DIR=%cd%\license
set CATALINA_HOME=%cd%\console\server\
set CATALINA_BASE=%CATALINA_HOME%

call "%CATALINA_HOME%\bin\service.bat" uninstall
set CATALINA_HOME=
set CATALINA_BASE=
set LICENSE_DIR=
set DISPLAYNAME=
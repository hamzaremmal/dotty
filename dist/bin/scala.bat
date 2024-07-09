@echo off
setlocal enabledelayedexpansion

@rem #########################################################################
@rem ## Environment setup

set _EXITCODE=0

for %%f in ("%~dp0.") do (
    set "_PROG_HOME=%%~dpf"
    @rem get rid of the trailing slash
    set "_PROG_HOME=!_PROG_HOME:~0,-1!"
)

@rem #########################################################################
@rem ## Call the new PowerShell script with arguments

set "args=%*"
call powershell.exe -ExecutionPolicy Bypass -File "%_PROG_HOME%\bin\scala.ps1" -ArgumentList "%args%"
if not %ERRORLEVEL%==0 (
    set _EXITCODE=1
    goto end
)

@rem #########################################################################
@rem ## Main (if needed to continue batch processing after the PowerShell script)

:end
exit /b %_EXITCODE%
endlocal

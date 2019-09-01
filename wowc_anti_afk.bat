@if (@CodeSection == @Batch) @then


@echo off
setlocal EnableDelayedExpansion


:: Use %SendKeys% to send keys to the keyboard buffer
SET SendKeys=CScript //nologo //E:JScript "%~F0"


:neverStop

SET /A idleTime=%RANDOM% * 300 / 32768 + 310
SET /A idleTime=%idleTime% * 1000
%SendKeys% %idleTime% " "
ECHO Pressed key {SPACE} after %idleTime%ms delay.
SET /A idleTime=%RANDOM% * 10 / 32768 + 1
SET /A idleTime=%idleTime% * 1000
%SendKeys% %idleTime% " "
ECHO Pressed key {SPACE} after %idleTime%ms delay.

SET /A idleTime=%RANDOM% * 300 / 32768 + 310
SET /A idleTime=%idleTime% * 1000
%SendKeys% %idleTime% "{ENTER}"
ECHO Planned to log out and log in again after %idleTime%ms delay.
ECHO Pressed key {ENTER} after %idleTime%ms delay.
SET /A idleTime=%RANDOM% * 5 / 32768 + 5
SET /A idleTime=%idleTime% * 1000
%SendKeys% %idleTime% "/logout"
ECHO Typed "/logout" after %idleTime%ms delay.
SET /A idleTime=%RANDOM% * 5 / 32768 + 5
SET /A idleTime=%idleTime% * 1000
%SendKeys% %idleTime% "{ENTER}"
ECHO Pressed key {ENTER} after %idleTime%ms delay.
SET /A idleTime=%RANDOM% * 30 / 32768 + 60
SET /A idleTime=%idleTime% * 1000
%SendKeys% %idleTime% "{ENTER}"
ECHO Pressed key {ENTER} after %idleTime%ms delay.
SET /A idleTime=%RANDOM% * 5 / 32768 + 5
SET /A idleTime=%idleTime% * 1000
%SendKeys% %idleTime% "{ENTER}"
ECHO Pressed key {ENTER} after %idleTime%ms delay.
SET /A idleTime=%RANDOM% * 5 / 32768 + 5
SET /A idleTime=%idleTime% * 1000
%SendKeys% %idleTime% "{ENTER}"
ECHO Pressed key {ENTER} after %idleTime%ms delay.
SET /A idleTime=%RANDOM% * 10 / 32768 + 1
SET /A idleTime=%idleTime% * 1000
%SendKeys% %idleTime% " "
ECHO Pressed key {SPACE} after %idleTime%ms delay.
SET /A idleTime=%RANDOM% * 10 / 32768 + 1
SET /A idleTime=%idleTime% * 1000
%SendKeys% %idleTime% " "
ECHO Pressed key {SPACE} after %idleTime%ms delay.

GOTO :neverStop


GOTO :EOF


:: define a function to get a random idle time to try to simulate human behavior
:getIdleTimeInMs
IF %~1 LEQ 500 (
    :: burst mode
    IF !RANDOM! LSS 29000 (
        :: have about 90% chance to keep staying in the burst mode
        SET /A idle=!RANDOM! * 500 / 32768 + 100
        SET /A %~2=!idle!
    ) ELSE (
        SET /A idle=!RANDOM! * 100 / 32768 + 1
        SET /A idle=!RANDOM! * !idle! / 32768 + 1
        SET /A idle=!RANDOM! * !idle! / 32768 + 1
        SET /A idle=!idle! * 1000
        SET /A %~2=!idle!
    )
) ELSE (
    IF !RANDOM! LSS 10000 (
        :: have about one third chance to get into the burst mode
        SET /A idle=!RANDOM! * 500 / 32768 + 100
        SET /A %~2=!idle!
    ) ELSE (
        SET /A idle=!RANDOM! * 100 / 32768 + 1
        SET /A idle=!RANDOM! * !idle! / 32768 + 1
        SET /A idle=!RANDOM! * !idle! / 32768 + 1
        SET /A idle=!idle! * 1000
    )
)
SET /A %~2=!idle!
EXIT /B 0


@end


// JScript section

var WshShell = WScript.CreateObject("WScript.Shell");
WScript.Sleep(WScript.Arguments(0));
WshShell.SendKeys(WScript.Arguments(1));



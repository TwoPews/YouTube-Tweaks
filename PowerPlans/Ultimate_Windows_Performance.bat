@echo off
setlocal enabledelayedexpansion
:: Ultimate Windows Performance (Desktop)
for /f "tokens=3" %%G in ('powercfg -duplicatescheme SCHEME_MIN ^| findstr /i "Power Scheme GUID"') do set "GUID=%%G"
if "%GUID%"=="" (
  echo Failed to create power plan. Run as Administrator.
  pause
  exit /b 1
)
powercfg -changename %GUID% "Ultimate Windows Performance" "Max performance + lowest latency"
powercfg -change -monitor-timeout-ac 0
powercfg -change -disk-timeout-ac 0
powercfg -change -standby-timeout-ac 0
powercfg -change -hibernate-timeout-ac 0
powercfg -setacvalueindex %GUID% 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg -setacvalueindex %GUID% 501a4d13-42af-4429-9fd1-a8218c268e20 ee12f906-d277-404b-b6da-e5fa1a576df5 0
powercfg -setacvalueindex %GUID% 54533251-82be-4824-96c1-47b60b740d00 893dee8e-2bef-41e0-89c6-b55d0929964c 100
powercfg -setacvalueindex %GUID% 54533251-82be-4824-96c1-47b60b740d00 bc5038f7-23e0-4960-96da-33abaf5935ec 100
powercfg -setacvalueindex %GUID% 54533251-82be-4824-96c1-47b60b740d00 be337238-0d82-4146-a960-4f3749d470c7 2
powercfg -setacvalueindex %GUID% 54533251-82be-4824-96c1-47b60b740d00 94d3a615-a899-4ac5-ae2b-e4d8f634367f 1
powercfg -setactive %GUID%
echo Created and activated: Ultimate Windows Performance
pause
endlocal

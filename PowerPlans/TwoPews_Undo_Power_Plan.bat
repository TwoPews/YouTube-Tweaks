@echo off
setlocal enabledelayedexpansion
:: ==========================================================
:: TwoPews - Undo / Revert Power Plan
:: Safely switches back to Balanced and removes custom plans
:: Run as Administrator
:: ==========================================================

echo.
echo Reverting to Windows Balanced power plan...
echo.

:: Set Balanced as active
powercfg -setactive SCHEME_BALANCED

:: Attempt to delete Ultimate Windows Performance plans if they exist
for %%P in ("Ultimate Windows Performance" "Ultimate Windows Performance (Laptop)") do (
    for /f "tokens=3" %%G in ('powercfg -list ^| findstr /i %%P') do (
        echo Removing power plan: %%P
        powercfg -delete %%G
    )
)

echo.
echo [OK] System reverted to Balanced power plan.
echo Any TwoPews custom power plans have been removed.
echo.
pause
endlocal

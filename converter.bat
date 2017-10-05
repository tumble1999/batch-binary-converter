@echo off
setlocal enabledelayedexpansion
:start
cls
title Converter
echo #^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=#
echo ^| 1. Decimal -^> Binary ^|
echo ^| 2. Binary -^> Decimal ^|
echo #^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=^=#
choice /c 12
echo.
if not ERRORLEVEL 2 goto dec_to_bin
if not ERRORLEVEL 3 goto bin_to_dec
goto start

:dec_to_bin
title Decimal to Binary Converter
set /p dec=Decimal Number: 
if %dec% lss 0 (
set startBit=1
) else (
set startBit=0
)
title %dec% - Binary to Decimal Converter
:dtb_loop 
set /a n=dec/2
set /a rem=dec-n*2
if %rem% lss 0 (
if defined bin (
set rem=0
) else (
set rem=1
)
)
if defined bin (
set bin=%rem%%bin%
) else (
set bin=%rem%
)
if not %n%==0 (
set dec=%n%
goto dtb_loop
)
set bin=%startBit%%bin%
set dec=
set n=
set rem=
echo Binary Number: %bin%
set bin=
echo.
pause
goto start

:bin_to_dec
title Binary to Decimal Converter
set /p bin=Binary Number: 
title %bin% - Binary to Decimal Converter
set dec=0
set n=0

:btd_loop
set rem=!bin:~%n%,1!
if defined rem (
if !n!==0 if !rem!==1 set dec=-1
set /a dec=dec*2

set /a dec=dec+rem
set /a n=n+1
goto btd_loop
)
set rem=
set bin=
set n=
echo Decimal Number: %dec%
set dec=
echo.
pause
goto start
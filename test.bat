@echo off

call :convert burbank
call :convert closeup
call :convert cloud
call :convert ikea
call :convert newyork
call :convert oregon
call :convert panel
call :convert portland
call :convert sanfran
call :convert spitfire
call :convert usbank

exit /b %ERRORLEVEL%


:convert
cargo run --release -- ^
    --pre-scale=0.2 ^
    --tone-map=reinhard-luma ^
    --desaturation-coeff=0.97 ^
    --histogram ^
    --histogram-min=0.005 ^
    --histogram-max=0.99 ^
    samples\%1-hdr.jxr ^
    samples\%1-sdr.png
exit /b 0

@echo off

set dateNow=%date:/=%
set timeNow=%time: =0%
set yyyy=%dateNow:~0,4%
set yy=%dateNow:~2,2%
set mm=%dateNow:~4,2%
set dd=%dateNow:~6,2%
set hh=%timeNow:~0,2%
set mi=%timeNow:~3,2%
set ss=%timeNow:~6,2%

set dirName=%yyyy%%mm%%dd%%hh%%mi%%ss%

@echo on

rmdir /Q /S public
@pause
hugo
@pause
aws s3 mv s3://fexl.tokyo/public  s3://fexl.tokyo/%dirName% --recursive 
aws s3 mv public s3://fexl.tokyo/public --recursive
@pause

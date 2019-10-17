@echo off

cd .\schema

echo Generating POC#O (Plain Old C# Objects) from Schema
echo WARNING: This Script currently relies on xsd.exe directory being in the "Path" Enviroment Variable 

SET index=1
SETLOCAL ENABLEDELAYEDEXPANSION
for /R %%S in (\*.xsd) do (
   xsd %%S xmldsig-core-schema_v1.01.xsd /c /o:..\model /n:CTe.v!index! /l:cs /edb
   SET /A index=!index!+1
)
SETLOCAL DISABLEDELAYEDEXPANSION
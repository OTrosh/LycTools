@echo off
rem ////////////////////////////////////
rem // Outil proposé par UTrosh
rem ////////////////////////////////////
set nodebin="./bin/nodejs/node.exe"
set npmbin="./bin/nodejs/npm.cmd"
set unzipbin="../unzip/unzip.exe"
set gui=false

rem // Check l'installation
title LycTools [] 0.1B
echo Verification de l'installation...
IF EXIST ./bin/install/installed.bin (
    echo Demarrage...
    IF gui==true (
        %nodebin% "./tools/gui.js"
    ) else (
        %nodebin% "./tools/cmdline.js"
    )
) ELSE (
    mkdir bin
    cd ./bin
    mkdir game
    mkdir nodejs
    mkdir unzip
    echo Installation des binaries...
    curl https://lyc.troshhost.fr/binaries/node/nod.zip --output node.zip
    curl https://lyc.troshhost.fr/binaries/unzip/unzip.exe --output unzip.exe
    move node.zip nodejs
    move unzip.exe unzip
    cd ./nodejs
    %unzipbin% "./node.zip"
    cd ../
    mkdir install
    echo Installed >> installed.bin
    move installed.bin install
    echo Installation fini, demarrage...
    cd ../
    %npmbin% "i"
    IF gui==true (
        %nodebin% "./tools/gui.js"
    ) else (
        %nodebin% "./tools/cmdline.js"
    )
)
@echo off
cd /D %~dp0
SET CONDA_SHLVL=

TITLE KoboldAI - Server
SET /P M=<loader.settings
IF %M%==1 GOTO drivemap
IF %M%==2 GOTO subfolder
IF %M%==3 GOTO drivemap_B

:subfolder
ECHO Runtime launching in subfolder mode
SET TEMP=%~DP0MINICONDA3
SET TMP=%~DP0MINICONDA3
call miniconda3\condabin\activate
python aiserver.py %*
cmd /k

:drivemap
ECHO Runtime launching in K: drive mode
subst /D K: >nul
subst K: miniconda3 >nul
SET TEMP=K:\
SET TMP=K:\
call K:\python\condabin\activate
python aiserver.py %*
cmd /k

:drivemap_B
ECHO Runtime launching in B: drive mode
subst /D B: >nul
subst B: miniconda3 >nul
SET TEMP=B:\
SET TMP=B:\
call B:\python\condabin\activate
python aiserver.py %*
cmd /k
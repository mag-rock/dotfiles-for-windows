@echo off
setlocal EnableDelayedExpansion
REM enthumble.exe�v���Z�X���ċN������o�b�`�t�@�C��

REM �f�t�H���g��enthumble.exe�̃p�X��ݒ�
set "enthumblePath=C:\Users\lvs-l\Dropbox\My Dropbox Soft\enthumble Full\enthumble.exe"

REM ���s����enthumble�v���Z�X���`�F�b�N
tasklist /FI "IMAGENAME eq enthumble.exe" /FO CSV | find /I "enthumble.exe" > nul
if %ERRORLEVEL% EQU 0 (
    echo enthumble�v���Z�X���~���Ă��܂�...
    
    REM �v���Z�X����p�X���擾����i�\�ȏꍇ�j
    for /f "tokens=2 delims=," %%a in ('wmic process where "name='enthumble.exe'" get ExecutablePath /format:csv ^| findstr /i "enthumble.exe"') do (
        set "processPath=%%a"
        set "processPath=!processPath:"=!"
        if exist "!processPath!" (
            set "enthumblePath=!processPath!"
            echo ���o���ꂽenthumble�̃p�X: !enthumblePath!
        )
    )
    
    REM enthumble�v���Z�X���~
    taskkill /F /IM enthumble.exe
    echo enthumble�v���Z�X���~���܂���
) else (
    echo ���s����enthumble�v���Z�X��������܂���ł����B�f�t�H���g�̃p�X���g�p���܂��B
)

REM �p�X�����݂��邩�m�F
if not exist "%enthumblePath%" (
    echo �w�肳�ꂽ�p�X '%enthumblePath%' ��enthumble.exe��������܂���B�������p�X���w�肵�Ă��������B
    exit /b 1
)

REM �����ҋ@
timeout /t 1 /nobreak > nul

REM enthumble���ċN��
echo enthumble���ċN�����Ă��܂�...
start "" "%enthumblePath%"
echo enthumble���ċN�����܂��� 
@echo off
setlocal EnableDelayedExpansion
REM enthumble.exeプロセスを再起動するバッチファイル

REM デフォルトのenthumble.exeのパスを設定
set "enthumblePath=C:\Users\lvs-l\Dropbox\My Dropbox Soft\enthumble Full\enthumble.exe"

REM 実行中のenthumbleプロセスをチェック
tasklist /FI "IMAGENAME eq enthumble.exe" /FO CSV | find /I "enthumble.exe" > nul
if %ERRORLEVEL% EQU 0 (
    echo enthumbleプロセスを停止しています...
    
    REM プロセスからパスを取得する（可能な場合）
    for /f "tokens=2 delims=," %%a in ('wmic process where "name='enthumble.exe'" get ExecutablePath /format:csv ^| findstr /i "enthumble.exe"') do (
        set "processPath=%%a"
        set "processPath=!processPath:"=!"
        if exist "!processPath!" (
            set "enthumblePath=!processPath!"
            echo 検出されたenthumbleのパス: !enthumblePath!
        )
    )
    
    REM enthumbleプロセスを停止
    taskkill /F /IM enthumble.exe
    echo enthumbleプロセスを停止しました
) else (
    echo 実行中のenthumbleプロセスが見つかりませんでした。デフォルトのパスを使用します。
)

REM パスが存在するか確認
if not exist "%enthumblePath%" (
    echo 指定されたパス '%enthumblePath%' にenthumble.exeが見つかりません。正しいパスを指定してください。
    exit /b 1
)

REM 少し待機
timeout /t 1 /nobreak > nul

REM enthumbleを再起動
echo enthumbleを再起動しています...
start "" "%enthumblePath%"
echo enthumbleを再起動しました 
# enthumble.exeプロセスを再起動するスクリプト

# enthumble.exeの完全パスを設定（デフォルト値）
$enthumblePath = "C:\Users\lvs-l\Dropbox\My Dropbox Soft\enthumble Full\enthumble.exe"  # デフォルトのパス

# 現在実行中のenthumbleプロセスを取得
$processes = Get-Process -Name enthumble -ErrorAction SilentlyContinue

# 実行中のプロセスからパスを取得
if ($processes) {
    # 最初のプロセスからパスを取得
    try {
        $processPath = $processes[0].Path
        if ($processPath) {
            $enthumblePath = $processPath
            Write-Output "検出されたenthumbleのパス: $enthumblePath"
        }
    } catch {
        Write-Output "プロセスからパスを取得できませんでした。デフォルトのパスを使用します。"
    }
    
    Write-Output "enthumbleプロセスを停止しています..."
    
    # すべてのenthumbleプロセスを停止
    $processes | ForEach-Object {
        $_.Kill()
        $_.WaitForExit()
    }
    
    Write-Output "enthumbleプロセスを停止しました"
} else {
    Write-Output "実行中のenthumbleプロセスが見つかりませんでした。デフォルトのパスを使用します。"
}

# パスが存在するか確認
if (-not (Test-Path $enthumblePath)) {
    Write-Error "指定されたパス '$enthumblePath' にenthumble.exeが見つかりません。正しいパスを指定してください。"
    exit 1
}

# 少し待機
Start-Sleep -Seconds 1

# enthumbleを再起動
Write-Output "enthumbleを再起動しています..."
Start-Process $enthumblePath
Write-Output "enthumbleを再起動しました"
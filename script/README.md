# 概要
restart-enthumbleスクリプトは、enthumble.exeプロセスを再起動するためのユーティリティです。プロセスを強制終了し、少し待機した後、再度起動します。

## 機能
- 実行中のenthumbleプロセスを自動的に検出
- 実行中のプロセスパスを取得して使用（可能な場合）
- プロセスの強制終了
- 正しいパスからの再起動

## 提供されるスクリプト
- `restart-enthumble.bat` - Windowsバッチファイル版
- `restart-enthumble.ps1` - PowerShell版

## タスクバーからスクリプトを実行する方法
「リンク先」が以下のショートカットファイルを作成して、タスクバーに登録

 - Windowsバッチファイル版
   - `C:\Windows\System32\cmd.exe /c "C:\Users\lvs-l\Dropbox\My Dropbox Soft\enthumble Full\script\restart-enthumble.bat"`
 - PowerShell版
   - `"C:\Program Files\PowerShell\7\pwsh.exe" -ExecutionPolicy Bypass -File "C:\Users\lvs-l\Dropbox\My Dropbox Soft\enthumble Full\script\restart-enthumble.ps1"`

## PowerShellスクリプトの実行方法
PowerShellから直接実行する場合:
```
.\restart-enthumble.ps1
```

## 注意事項
- デフォルトのenthumbleパスは `C:\Users\lvs-l\Dropbox\My Dropbox Soft\enthumble Full\enthumble.exe` に設定されています
- 実行中のプロセスが見つからない場合、このデフォルトパスが使用されます
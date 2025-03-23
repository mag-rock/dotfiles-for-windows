# インストール

## 事前準備

1. Microsoft Storeが有効になっていることを確認してください。
2. App Installerがインストールされていることを確認してください。インストールされていない場合は、Microsoft Storeから「App Installer」を検索してインストールしてください。

## インストール方法

1. コマンドプロンプト（cmd）またはWindows PowerShellを実行します。
2. 以下のコマンドを実行して、ソフトウェアをインストールします。

```cmd
winget import -i winget-packages-work.jsonc --accept-package-agreements --accept-source-agreements --no-upgrade
```
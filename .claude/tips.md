# 開発Tips

## TypeScript関連
- ターゲットはFirefox 115（Zotero 7互換）
- `__env__`グローバル変数で開発/本番環境を判定可能
- Zoteroグローバルオブジェクトへのアクセスは`Zotero.getMainWindow()`を使用

## ビルド関連
- `zotero-plugin-scaffold`を使用したビルドシステム
- ビルド時にpackage.jsonの設定が自動的に注入される
- XPIファイルは`build/`ディレクトリに生成される

## 多言語対応
- Fluent Translation List (FTL)形式を使用
- 新しい翻訳キーは全言語ファイルに追加が必要
- `getString()`ヘルパー関数で翻訳を取得

## デバッグ
- Zoteroの開発者ツールでコンソールログを確認
- `ztoolkit.log()`でログ出力可能

## 設定管理
- 設定は`extensions.zotero.pdf2zh`プレフィックスを使用
- `getPref()`/`setPref()`ユーティリティで設定の読み書き
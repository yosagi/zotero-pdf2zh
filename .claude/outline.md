# Zotero PDF2zh プロジェクト概要

## システム構成
1. **PDF翻訳システム (pdf2zh)** - サブモジュール `/pdf2zh` に配置（日本語向けフォーク）
2. **翻訳サーバー** - `server.py` で実装、Docker compose で起動
3. **Zoteroプラグイン** - TypeScriptで実装、無改造で使用

## ディレクトリ構成

### ソースコード (`src/`)
- `index.ts` - プラグインのエントリーポイント、初期化処理
- `addon.ts` - プラグインの基底クラス、データとAPIの管理
- `hooks.ts` - Zoteroライフサイクルイベントのフック定義
- `modules/`
  - `examples.ts` - PDF翻訳、裁剪、対照表示の主要機能実装
  - `preferenceScript.ts` - 設定画面のロジック
- `utils/`
  - `ztoolkit.ts` - Zotero Plugin Toolkitインスタンス
  - `locale.ts` - 多言語対応ユーティリティ
  - `prefs.ts` - 設定管理ユーティリティ
  - `window.ts` - ウィンドウ管理ユーティリティ

### アドオンリソース (`addon/`)
- `manifest.json` - Zoteroプラグインマニフェスト
- `bootstrap.js` - プラグインのブートストラップ
- `prefs.js` - 設定画面の初期化
- `content/`
  - `preferences.xhtml` - 設定画面UI定義
  - `zoteroPane.css` - カスタムスタイル
  - `icons/` - アイコンファイル
- `locale/` - 多言語翻訳ファイル（en-US, zh-CN）

### サーバー関連
- `server.py` - PDF2zh翻訳サーバー実装（日本語向けカスタマイズ済み）
- `docker-compose.yaml` - Docker環境設定（日本語プロンプト設定含む）
- `Dockerfile` - Dockerイメージ定義

### その他
- `package.json` - Node.jsプロジェクト設定
- `tsconfig.json` - TypeScript設定
- `eslint.config.mjs` - ESLint設定
- `zotero-plugin.config.ts` - プラグインビルド設定

## 技術スタック
- TypeScript（ES2016ターゲット）
- Zotero Plugin Toolkit
- ESBuild（ビルドツール）
- Docker対応
- PDF2zh（Python翻訳エンジン）
- Flask（翻訳サーバー）

## 主要機能
1. PDF翻訳（mono/dual形式）
2. PDF裁剪（双栏→単栏）
3. 双栏対照表示（双栏/単栏）
4. 多種翻訳サービス対応（Bing, Google, OpenAI, DeepSeek, Zhipu等）
5. 日本語特化プロンプト対応

## 現在の状況
- 現在のブランチ: en2ja（日本語向け修正版）
- 上流最新版との互換性問題あり
- 目標: server.pyを修正して最新版Zoteroプラグインとの互換性を回復
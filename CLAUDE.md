# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

**言語設定**: このプロジェクトでは日本語でのコミュニケーションを基本とします。コード内のコメントやドキュメントも日本語で記述してください。

## プロジェクト概要
Zotero PDF2zhは、Zotero内でPDF2zh（PDFMathTranslate）を使用してPDFの翻訳を行うプラグインです。

## 開発コマンド
```bash
# 開発サーバーの起動
npm start

# ビルド（TypeScriptのコンパイルチェック後）
npm run build

# コードの品質チェック
npm run lint:check

# コードの自動修正
npm run lint:fix

# リリースビルド
npm run release

# 依存関係の更新
npm run update-deps
```

## アーキテクチャ概要
- **エントリーポイント**: `src/index.ts` - Zoteroプラグインの初期化
- **コア構造**: `src/addon.ts` - プラグインの基底クラス、設定とライフサイクル管理
- **フック管理**: `src/hooks.ts` - Zoteroイベントのフック定義
- **主要モジュール**:
  - `src/modules/examples.ts` - メイン機能の実装（PDF翻訳、裁剪、対照表示）
  - `src/modules/preferenceScript.ts` - 設定画面のスクリプト
- **ユーティリティ**:
  - `src/utils/ztoolkit.ts` - Zotero Plugin Toolkitのインスタンス管理
  - `src/utils/locale.ts` - 多言語対応（日本語、中国語、英語）
  - `src/utils/prefs.ts` - 設定の読み書き
- **UI定義**: `addon/` ディレクトリ内
  - `preferences.xhtml` - 設定画面のXHTML定義
  - `locale/*/` - 各言語の翻訳ファイル（.ftl形式）

## ビルドシステム
- **zotero-plugin-scaffold**を使用したビルド設定（`zotero-plugin.config.ts`）
- TypeScript → JavaScript変換（ESBuildを使用）
- ターゲット: Firefox 115（Zotero 7互換）

## ドキュメント化
- 開発の過程での様々な調査の結果は `reports/` ディレクトリ以下にドキュメントを保存する
- 一定の区切りに達する毎に進捗レポートを記述する。これは `reports/` ディレクトリ以下に `YYYY-MM-DD_changes_[MAJOR_TOPIC].md` という形式のファイルで作成し、それまでの作業の目的、内容、成果、遭遇した問題点と解決法についてまとめた内容とする。作成するタイミングはユーザの判断で作成を依頼されたときか、自ら判断してユーザに許可を求めても良い。
- **重要**: ファイル名に日付を含める際は必ず `date` コマンドで現在の日時を確認してから使用すること

その他このプロジェクトに関する情報を `.claude/` の以下のファイルに記載するので適宜参照、追記、更新すること：

- `outline.md`: このプロジェクトのディレクトリおよび各コンポーネントの構成の概要、技術的課題、ロードマップなど
- `dev_commands.md`: 開発の過程で有用な各種コマンド
- `tips.md`: 開発の過程で見つけた実装上の問題とその解決方法のメモ
- `misc.md`: その他 /init 時に claude が発見して記述した情報をここに残しておく

## 重要な指示
- 要求されたことを実行し、それ以上でもそれ以下でもない
- 目標達成に絶対必要でない限り、ファイルを新規作成しない
- 常に既存ファイルの編集を新規作成より優先する
- ユーザーから明示的に要求されない限り、ドキュメントファイル（*.md）やREADMEファイルを積極的に作成しない

## ブランチ作業ルール
- **作業対象ブランチ**: 編集・修正作業は必ず `en2ja` ブランチで行う
- **参照のみ**: 他のブランチは参照目的でのみチェックアウト可能
- **最新化の手順**: 最新のcommitを使用する場合は `en2ja` ブランチに `upstream/main` をmergeしてから作業する

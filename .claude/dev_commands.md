# 開発用コマンド集

## 基本的な開発コマンド

### 開発環境
```bash
# 開発サーバーの起動（ホットリロード付き）
npm start

# ビルド（型チェック付き）
npm run build

# リリースビルド
npm run release
```

### コード品質
```bash
# Prettier + ESLintでコードチェック
npm run lint:check

# 自動修正
npm run lint:fix
```

### 依存関係管理
```bash
# 依存関係の更新
npm run update-deps

# パッケージのインストール
npm install
```

## PDF2zh サーバー関連

### 通常起動
```bash
# デフォルトポート（8888）で起動
python server.py 8888

# カスタムポートで起動
python server.py 9999
```

### Docker起動
```bash
# Dockerイメージのビルド
docker build --build-arg ZOTERO_PDF2ZH_FROM_IMAGE=byaidu/pdf2zh:1.9.6 --build-arg ZOTERO_PDF2ZH_SERVER_FILE_DOWNLOAD_URL=https://raw.githubusercontent.com/guaguastandup/zotero-pdf2zh/refs/tags/v2.3.1/server.py -t zotero-pdf2zh .

# コンテナの実行
docker run zotero-pdf2zh

# docker-composeを使用
docker compose build
docker compose up -d
```

## Git関連
```bash
# 現在のブランチ確認
git branch

# メインブランチへの切り替え
git checkout main

# 上流の変更を取り込む
git fetch upstream
git merge upstream/main
```
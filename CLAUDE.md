# CLAUDE.md

## 目的

このリポジトリは、GitHub Template Repository として再利用できるスターターテンプレートを作成・検証・保守するための親リポジトリです。

## 作業ルール

- `templates/` を生成元の source of truth として扱ってください。
- 各テンプレートはコピー後すぐに独立利用できる状態を保ってください。
- 過剰設計を避け、最小構成だが実務で育てやすい土台を優先してください。
- ドキュメント、コマンド、デバッグ設定、CI を実装と必ず整合させてください。

## 必須ファイル

root および各テンプレートでは、該当する範囲で次のファイル群を維持してください。

- `README.md`
- `AGENTS.md`
- `CLAUDE.md`
- `Makefile`
- `.vscode/launch.json`
- `.github/workflows/ci.yml`
- `docs/architecture.md`
- `docs/decision-log.md`
- `tests/`

## 検証

- テンプレートを生成・編集したら `make validate` を実行してください。
- テンプレート構成を変えたら `scripts/validate-template.sh` を更新してください。
- コマンドや entrypoint を変えた場合は `README.md`、`AGENTS.md`、`CLAUDE.md`、`.vscode/launch.json`、GitHub Actions を同じ変更で更新してください。

## 運用ガードレール

- GitHub Actions を変更する前に、関連するチーム運用ルールや skill を確認し、現行のサポートされた action version を使ってください。
- placeholder の挙動は `scripts/create-template.sh` と同期させてください。
- 人間にも AI agent にも拡張しやすい構成を保ってください。

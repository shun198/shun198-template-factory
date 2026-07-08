# AGENTS.md

## 目的

このリポジトリは、GitHub Template Repository として公開できる実務向けスターターテンプレートを作成・検証・保守するための親リポジトリです。

## `templates/` を編集するときのルール

- `templates/` 配下の各ディレクトリは、それ単体で利用できるスターターとして扱ってください。
- 変更は最小限かつ実務的にし、拡張しやすさを優先してください。
- 対象ユースケースに直接必要でない重い依存はむやみに追加しないでください。
- 各テンプレートで必須ファイル構成を崩さないでください。
- `scripts/create-template.sh` が安全に置換できるよう、placeholder は一貫性を保ってください。

## 必須ファイル

各テンプレートを変更するときは、少なくとも次を欠落させないでください。

- `README.md`
- `AGENTS.md`
- `CLAUDE.md`
- `Makefile`
- `.vscode/launch.json`
- `.github/workflows/ci.yml`
- `docs/architecture.md`
- `docs/decision-log.md`
- `tests/`

## 検証ルール

- テンプレートの生成後や編集後は必ず `make validate` を実行してください。
- テンプレートの構成やファイル名を変えた場合は `scripts/validate-template.sh` も更新してください。
- コマンドや実行方法を変えた場合は `README.md`、`AGENTS.md`、`CLAUDE.md`、`Makefile`、`launch.json`、GitHub Actions を同じ変更で更新してください。

## 設計上の制約

- 過剰設計を避けてください。
- 空のひな形よりも、小さくても実務で拡張しやすい実装を優先してください。
- README の手順と実装・コマンドの差分を出さないでください。
- 実行方法やエントリーポイントが変わったら `.vscode/launch.json` と `.github/workflows/ci.yml` も必ず更新してください。
- GitHub Actions を編集するときは、関連するチーム運用ルールや skill を先に確認し、現行のサポートされた action version を使ってください。

## 作業チェックリスト

作業を終える前に、次を確認してください。

1. 必須ファイルが存在していること
2. ドキュメントに書かれたコマンドと `Makefile` が一致していること
3. `make validate` が通ること
4. 不要に複雑な実装が入っていないこと

# CLAUDE.md

## テンプレートの目的

このテンプレートは、小規模な Google Cloud 環境を Terraform で安全に育てていくためのスターターです。

## 作業ルール

- 環境ごとの root module は `envs/` に置いてください。
- 再利用するインフラ部品は `modules/` に切り出してください。
- IAM 権限は最小権限を基本とし、必要な理由を説明できる状態を保ってください。
- `README.md`、`AGENTS.md`、`CLAUDE.md`、`Makefile`、debug 設定、CI と Terraform コマンドを常に整合させてください。
- secret や backend state の実値をハードコードしないでください。

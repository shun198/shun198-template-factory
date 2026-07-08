# AGENTS.md

## テンプレートの目的

このテンプレートは、Python 製の CLI ツール、小規模 API、automation script の土台として使います。

## 作業ルール

- `src/` レイアウトを維持してください。
- 明確な理由がない限り、依存追加より標準ライブラリを優先してください。
- `README.md`、`Makefile`、`.vscode/launch.json`、CI の内容をコマンド変更に追従させてください。
- サンプルアプリは常に実行可能な状態を保ってください。
- `mypy`、`ruff`、`pytest` が通る型付きコードを維持してください。

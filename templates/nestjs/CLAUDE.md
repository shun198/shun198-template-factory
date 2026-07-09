# CLAUDE.md

## テンプレートの目的

このテンプレートは、実務向け NestJS API を小さく始めつつ拡張しやすく保つためのスターターです。

## 作業ルール

- 機能ごとのコードは module 単位で整理してください。
- 設定読み込みは `src/config` に集約してください。
- ヘルスチェック endpoint を壊さないでください。
- `README.md`、`AGENTS.md`、`CLAUDE.md`、`Makefile`、debug 設定、CI を常に整合させてください。
- 必要になる前から framework の複雑さを増やしすぎないでください。

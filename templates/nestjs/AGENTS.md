# AGENTS.md

## テンプレートの目的

このテンプレートは、実務向けの NestJS API を小さく始めて育てるための土台です。

## 作業ルール

- 機能ごとのコードは module 単位で整理してください。
- 設定読み込みは `src/config` に集約してください。
- ヘルスチェック endpoint を壊さないでください。
- `README.md`、`Makefile`、debug 設定、CI を常に整合させてください。
- 必要になる前から framework の複雑さを増やしすぎないでください。

---
name: implement
description: 実装を行う。ユーザーが実装指示を行った際に使用する。
argument-hint: [実装の意図や目的]
disable-model-invocation: true
---

# Implement

以下の意図・目的にそって実装を行う。
Intent: $ARGUMENTS

Intent が空の場合はコンテキストから判断する。

## Workflow

### 0. Common

実装において知るべき[前提知識](common.md)。
最初だけ読み、以降は必要な時のみ参照する。

### 1. Classification (実装タイプ分類)

ユーザーの意図からどの実装タイプに当てはまるのか分類する。
引数がない場合は、コンテキストから推論する。

- feature: 新たな実装や機能追加を行う。
- fix: バグ修正など、既存のコードに修正を加える。
- refactor: リファクタリングを行う。

### 2. Investigation (調査)

- [ ] 実装内容における前提情報などを Web、ドキュメントで調査する。
- [ ] コードベースの技術スタック・設計方針 (どこに何を書くべきかなど) ・コーディングスタイルなどを把握する。
- [ ] 調査結果とユーザーの意図を踏まえて実装する内容を整理する。
- [ ] ユーザーの意図を超えた範囲で懸念や確認事項がある場合は、ユーザーへ確認する。(このステップは省略可能)

### 3. Implementation (実装)

分類結果に合わせて以下の実装を行う

- Match(type)
  - feature => [Implement new feature](feature.md)
  - fix => [Implement fix](fix.md)
  - refactor => [Implement refactoring](refactoring.md)

### 4. Summarization (まとめ)

[フォーマット](summary.md) にしたがい、実装内容をまとめる。

# 🤝 コントリビューションガイドライン

<!-- textlint-disable ja-technical-writing/no-exclamation-question-mark -->

このプロジェクトへの貢献をご検討いただき、ありがとうございます!
皆さまのご協力により、よりよいプロジェクトを築いていけることを願っております。

<!-- textlint-enable -->

## 📝 貢献の方法

### 1. Issue の報告

- バグ報告や機能提案は、[Issue](https://github.com/aglabo/agla-dev-tools/issues) にてお願いいたします。
- 報告の際は、再現手順や期待される動作、実際の動作など、詳細な情報を提供してください。

### 2. プルリクエストの提出

- リポジトリをフォークし、`feature/your-feature-name` のようなブランチを作成してください。
- ソースコード、あるいはドキュメントを変更し、順次コミットしてください。
  - コミットメッセージは [ConventionalCommit](https://www.conventionalcommits.org/ja/v1.0.0/) にしたがってください。
  - 1機能ごとにコミットし、あとで rebase することでいいコミットが作成できます。
- プルリクエストには、タイトルに変更の概要や目的を 1 行で、本文に概要の説明や背景を描いてください。

## プロジェクト環境

### 開発環境のセットアップ

次の手順で、開発環境をセットアップします。

```bash
git clone https://github.com/aglabo/agla-dev-tools.git
cd agla-dev-tools
pnpm install   # `prepare` スクリプトが scripts/setup-dev-env.sh を実行します
```

必要環境は Node.js 24 以上、pnpm 12 以上、bash です。

### テスト

変更を加えた際は、変更内容に応じて以下のコマンドを実行し、既存の機能が影響を受けていないことを確認してください。

- shellspec (`pnpm run test:sh`)
  シェルスクリプトのテストを実行します。
- shellcheck (`pnpm run lint:sh`)
  シェルスクリプトを静的解析します。
- shfmt (`pnpm run check:sh`)
  シェルスクリプトの書式を検査します。
- jactionlint / ghalint (`pnpm run lint:gha`)
  GitHub Actions ワークフローを検証します。
- textlint (`pnpm run lint:text`)
  技術文書として読みやすく、表現上の問題がないかを検証します。
- markdownlint (`pnpm run lint:markdown`)
  マークダウン形式のテキストが正しく記述されているか確認します。
- cspell (`pnpm run lint:spells`)
  スペルを検査します。

### コードスタイルとフォーマット

このプロジェクトでは、コードのフォーマット、リントに以下を使用しています。

<!-- textlint-disable ja-technical-writing/max-comma -->

- コードフォーマット: dprint (`pnpm run format:dprint`)、shfmt (`pnpm run format:sh`)
- リント: shellcheck, jactionlint, ghalint, textlint, markdownlint
- スペルチェック: cspell

<!-- textlint-enable ja-technical-writing/max-comma -->

## 行動規範

すべてのコントリビューターは、[行動規範](https://github.com/aglabo/.github/blob/main/.github/CODE_of_CONDUCT.ja.md) を遵守してください。

## 参考

- [GitHub Docs: リポジトリコントリビューターのためのガイドラインを定める](https://docs.github.com/ja/communities/setting-up-your-project-for-healthy-contributions/setting-guidelines-for-repository-contributors)

---

## 📬 Issue / Pull Request

<!-- textlint-disable @textlint-ja/ai-writing/no-ai-list-formatting -->

- [🐛 バグ報告を作成する](https://github.com/aglabo/agla-dev-tools/issues/new?template=bug_report.yml)
- [✨ 機能提案を作成する](https://github.com/aglabo/agla-dev-tools/issues/new?template=feature_request.yml)
- [💬 自由トピックを投稿する](https://github.com/aglabo/agla-dev-tools/issues/new?template=open_topic.yml)
- [🔀 Pull Request を作成する](https://github.com/aglabo/agla-dev-tools/compare)

<!-- textlint-enable -->

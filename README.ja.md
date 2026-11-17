# agla-dev-tools(日本語版)

aglabo プロジェクト向けの開発ツール管理パッケージです。
ツールラッパー(`bin/`)、lint/テスト用ランナー(`runners/`)、共通ツール設定(`configs/`)、Git フックをまとめています。

---

## 特徴

<!-- textlint-disable ja-technical-writing/max-comma -->

- `bin/` のツールラッパー: pnpm でインストールしたコマンドを解決します(POSIX シェル / Windows `.cmd`)
  - `commitlint`, `concurrently`, `ls-lint`, `rimraf`, `secretlint`
- `runners/` のランナースクリプト: lint・フォーマット・テストを実行します
  - `jactionlint`, `ghalint`, `markdownlint`, `shellcheck`, `shellspec`, `shfmt`, `textlint`, `betterleaks`
- `configs/` の共通ツール設定(betterleaks, git-cliff, commitlint, secretlint, shellcheck)
- lefthook による Git フック
  - `pre-commit`: `betterleaks` と `secretlint` によるシークレット検出
  - `prepare-commit-msg`: AI によるコミットメッセージ案の生成(`scripts/prepare-commit-msg.sh`)
  - `commit-msg`: `commitlint` による Conventional Commits の検証

<!-- textlint-enable ja-technical-writing/max-comma -->

## 使用方法

必要環境は Node.js 24 以上、pnpm 12 以上、bash です。

```bash
git clone https://github.com/aglabo/agla-dev-tools.git
cd agla-dev-tools
pnpm install   # `prepare` スクリプトが scripts/setup-dev-env.sh を実行します
```

`scripts/setup-dev-env.sh` はローカル環境(lefthook フック、shellspec、aglabo ツール)をセットアップします。
CI 環境では何もしません。

## コマンド一覧

| コマンド                                    | 説明                                        |
| ------------------------------------------- | ------------------------------------------- |
| `pnpm run scan:secrets`                     | シークレット検出(secretlint, betterleaks)   |
| `pnpm run check:sh` / `pnpm run format:sh`  | シェルスクリプトの検査 / 整形(shfmt)        |
| `pnpm run lint:sh`                          | シェルスクリプトの静的解析(shellcheck)      |
| `pnpm run test:sh` / `pnpm run test:sh:all` | ShellSpec テストの実行                      |
| `pnpm run lint:gha`                         | GitHub Actions の検証(jactionlint, ghalint) |
| `pnpm run lint:text` / `lint:markdown`      | ドキュメントの検証(textlint, markdownlint)  |
| `pnpm run lint:spells`                      | スペルチェック(cspell)                      |
| `pnpm run check:dprint` / `format:dprint`   | dprint による検査 / 整形                    |

## 含まれるツール一覧

| ツール名     | 説明                                           |
| ------------ | ---------------------------------------------- |
| lefthook     | Git フックの管理                               |
| commitlint   | コミットメッセージ形式の検証                   |
| betterleaks  | リポジトリ内の機密情報を検出                   |
| secretlint   | シークレット情報の混入を検出する静的解析ツール |
| ls-lint      | ファイル名・ディレクトリ名の検証               |
| shellcheck   | シェルスクリプトの静的解析                     |
| shfmt        | シェルスクリプトのフォーマッター               |
| shellspec    | シェルスクリプト向け BDD テストフレームワーク  |
| jactionlint  | GitHub Actions ワークフローの検証              |
| ghalint      | GitHub Actions のセキュリティ検証              |
| textlint     | ドキュメントの文章検証                         |
| markdownlint | Markdown の検証                                |
| cspell       | スペルチェックツール(コード/ドキュメント向け)  |
| dprint       | コードフォーマッター                           |

> **注意事項**
> `commitlint`、`concurrently`、`ls-lint`、`rimraf`、`secretlint` は pnpm でインストールされます。
> それ以外のツールは別途インストールし、`PATH` から実行できるようにしてください。

## ライセンス

このプロジェクトは MIT ライセンスのもとで提供されています。
詳細は [LICENSE](./LICENSE) をご確認ください。

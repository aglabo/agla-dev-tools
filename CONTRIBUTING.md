# 🤝 Contribution Guidelines

<!-- textlint-disable ja-technical-writing/no-exclamation-question-mark -->

Thank you for thinking about contributing to this project!
We hope your ideas will help make this project even better.

<!-- textlint-enable -->

## 📝 How to contribute

### 1. Report an Issue

- Please use [Issues](https://github.com/aglabo/agla-dev-tools/issues) to report bugs or suggest features.
- Add enough details (steps, expected behavior, actual behavior).

### 2. Submit a Pull Request

- Fork the repository and create a new branch like `feature/your-feature-name`.
- Make your changes and commit them clearly.
  - Follow [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).
  - Make one commit per change if possible, and rebase later to clean history.
- Write a clear title and description for your pull request.

## 🔧 Project environment

### Setup

```bash
git clone https://github.com/aglabo/agla-dev-tools.git
cd agla-dev-tools
pnpm install   # the `prepare` script runs scripts/setup-dev-env.sh
```

Requirements: Node.js 24+, pnpm 12+, and bash.

### Testing

When you make changes, please run the checks that match your changes:

- **shellspec** (`pnpm run test:sh`)
  Run the tests for shell scripts.
- **shellcheck** (`pnpm run lint:sh`)
  Lint shell scripts.
- **shfmt** (`pnpm run check:sh`)
  Check the format of shell scripts.
- **jactionlint / ghalint** (`pnpm run lint:gha`)
  Lint GitHub Actions workflows.
- **textlint** (`pnpm run lint:text`)
  Check writing quality for technical documentation.
- **markdownlint** (`pnpm run lint:markdown`)
  Check if Markdown format is correct.
- **cspell** (`pnpm run lint:spells`)
  Check spelling.

### Code style and format

We use these tools:

<!-- textlint-disable ja-technical-writing/max-comma -->

- Formatters: dprint (`pnpm run format:dprint`), shfmt (`pnpm run format:sh`)
- Linters: shellcheck, jactionlint, ghalint, textlint, markdownlint
- Spell checker: cspell

<!-- textlint-enable ja-technical-writing/max-comma -->

## 📜 Code of Conduct

All contributors must follow our [CODE_OF_CONDUCT.md](https://github.com/aglabo/.github/blob/main/.github/CODE_of_CONDUCT.md).

## 📚 References

- [GitHub Docs: Setting guidelines for repository contributors](https://docs.github.com/en/communities/setting-up-your-project-for-healthy-contributions/setting-guidelines-for-repository-contributors)

---

## 📬 Create an Issue or PR

<!-- textlint-disable @textlint-ja/ai-writing/no-ai-list-formatting -->

- [🐛 Report a Bug](https://github.com/aglabo/agla-dev-tools/issues/new?template=bug_report.yml)
- [✨ Request a Feature](https://github.com/aglabo/agla-dev-tools/issues/new?template=feature_request.yml)
- [💬 Open a Topic](https://github.com/aglabo/agla-dev-tools/issues/new?template=open_topic.yml)
- [🔀 Create a Pull Request](https://github.com/aglabo/agla-dev-tools/compare)

<!-- textlint-enable -->

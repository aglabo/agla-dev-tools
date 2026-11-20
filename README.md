# agla-dev-tools

Development tools management package for aglabo projects.
It bundles tool wrappers (`bin/`) and lint/test runners (`runners/`).
It also provides shared tool configs (`configs/`) and Git hooks.

---

## Features

<!-- textlint-disable ja-technical-writing/max-comma -->

- Tool wrappers in `bin/` that delegate to the shared runner `bin/libs/run-node-bin` (POSIX shell and Windows `.cmd`, no bash needed on Windows)
  - `commitlint`, `concurrently`, `ls-lint`, `rimraf`, `secretlint`
- Runner scripts in `runners/` for linting, formatting, and testing
  - `jactionlint`, `ghalint`, `markdownlint`, `shellcheck`, `shellspec`, `shfmt`, `textlint`, `betterleaks`
- Shared tool configs in `configs/` (betterleaks, git-cliff, commitlint, secretlint, shellcheck)
- Git hooks powered by `lefthook`
  - `pre-commit`: secret scanning with `betterleaks` and `secretlint`
  - `prepare-commit-msg`: AI-generated commit message draft (`scripts/prepare-commit-msg.sh`)
  - `commit-msg`: Conventional Commits check with `commitlint`

<!-- textlint-enable ja-technical-writing/max-comma -->

## Getting Started

Requirements: Node.js 24+, pnpm 12+, and bash.

```bash
git clone https://github.com/aglabo/agla-dev-tools.git
cd agla-dev-tools
pnpm install   # the `prepare` script runs scripts/setup-dev-env.sh
```

`scripts/setup-dev-env.sh` sets up the local environment (lefthook hooks, shellspec, aglabo tools).
It does nothing in CI.

## Commands

| Command                                     | Description                                |
| ------------------------------------------- | ------------------------------------------ |
| `pnpm run scan:secrets`                     | Scan for secrets (secretlint, betterleaks) |
| `pnpm run check:sh` / `pnpm run format:sh`  | Check / format shell scripts (shfmt)       |
| `pnpm run lint:sh`                          | Lint shell scripts (shellcheck)            |
| `pnpm run test:sh` / `pnpm run test:sh:all` | Run ShellSpec tests                        |
| `pnpm run lint:gha`                         | Lint GitHub Actions (jactionlint, ghalint) |
| `pnpm run lint:text` / `lint:markdown`      | Lint documents (textlint, markdownlint)    |
| `pnpm run lint:spells`                      | Spell check (cspell)                       |
| `pnpm run check:dprint` / `format:dprint`   | Check / format with dprint                 |

## Included Tools

| Tool         | Description                                    |
| ------------ | ---------------------------------------------- |
| lefthook     | Git hook manager                               |
| commitlint   | Commit message format linting                  |
| betterleaks  | Detects secrets and credentials in the repo    |
| secretlint   | Static analysis tool to catch secrets in files |
| ls-lint      | File and directory name linting                |
| shellcheck   | Static analysis for shell scripts              |
| shfmt        | Shell script formatter                         |
| shellspec    | BDD testing framework for shell scripts        |
| jactionlint  | GitHub Actions workflow linter                 |
| ghalint      | GitHub Actions security linter                 |
| textlint     | Text linting for documents                     |
| markdownlint | Markdown linting                               |
| cspell       | Spellchecker for code and documentation        |
| dprint       | Code formatter                                 |

> **Note**
> `commitlint`, `concurrently`, `ls-lint`, `rimraf`, and `secretlint` are installed by pnpm.
> The other tools are installed separately and must be available on `PATH`.

## License

This project is licensed under the MIT License.
For more details, see [LICENSE](./LICENSE).

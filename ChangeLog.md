---
title: "agla-dev-tools Change Log"
version: "0.1.1"
date: 2026-10-27
tags:
  - release
summary: >
  v0.1.1 adds rimraf wrapper scripts, updates development tooling and dependencies,
  and improves CI and repository configuration.
---

## [0.1.1] - 2026-10-27

### Features

- Add POSIX and Windows wrapper scripts for `rimraf`.
- Add `rimraf` as a dependency and update the package manager, Node.js requirement, and development dependencies.
- Recognize `fable` as an Anthropic model in the commit message hook.

### Configuration

- Update CI workflow names, concurrency settings, and reusable workflow references.
- Anchor `.gitignore` exceptions at the repository root and ignore `temp` and `tmp` directories at any depth.
- Upgrade the Markdown plugin and development dependencies; add pnpm workspace configuration.
- Add an empty MCP server configuration and assign repository-wide code ownership.
- Correct the pnpm engine key and raise its minimum version.

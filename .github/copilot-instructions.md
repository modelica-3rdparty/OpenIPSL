<!-- Copilot / AI agent instructions for contributors working on OpenIPSL -->
# OpenIPSL — Quick AI assistant guide

Purpose: give actionable, repository-specific guidance so an AI coding agent can be productive immediately.

Big picture
- Library of Modelica components arranged as Modelica packages. Main source tree: [OpenIPSL](OpenIPSL).
- Models are organized by domain packages (e.g. [OpenIPSL/Electrical](OpenIPSL/Electrical), [OpenIPSL/Data](OpenIPSL/Data)).
- Documentation lives in Modelica annotations and the Users Guide ([OpenIPSL/UsersGuide](OpenIPSL/UsersGuide)).

Key files & folders
- [README.md](README.md) — project summary; recommends using OpenModelica.
- [OpenIPSL/package.mo](OpenIPSL/package.mo) and `package.order` files — package layout and public API.
- [OpenIPSL/Tests](OpenIPSL/Tests) — regression and unit-style packages for CI/validation.
- [.CI](.CI) — repository helper scripts used by CI (see `.CI/check_html.py`, `.CI/check_deprecated_line_color.py`).
- [.github/workflows/checkCI.yml](.github/workflows/checkCI.yml) — authoritative list of repository checks and exact commands used on CI.

Developer workflows (examples taken from CI)
- HTML/docs checks: `python ./.CI/check_html.py tidyHTML ./OpenIPSL/` and `python ./.CI/check_html.py checkTags ./OpenIPSL/`.
- Deprecation checks: `python ./.CI/check_deprecated_line_color.py OpenIPSL`.
- Syntax & encoding checks: CI clones ModelicaSyntaxChecker and runs `moparser -v 3.4 -r OpenIPSL`; CI also checks UTF‑8 and BOM with `iconv` and `grep` commands. Replicate these locally for pre-commit checks.
- CI builds tidy-html5 from source; treat that as an external dev dependency only for documentation linting.

Project-specific conventions and patterns
- Everything is a Modelica package: changes typically involve `package.mo` and files under the package directory; follow existing package structure and `package.order` to determine public API ordering.
- Documentation is not a separate docs site — prefer editing Modelica annotations or UsersGuide pages in [OpenIPSL/UsersGuide](OpenIPSL/UsersGuide).
- Keep Modelica source encoded as UTF-8 without BOM; CI will fail on encoding/BOM issues.
- Avoid committing tool-generated files or large diffs from Modelica GUI tools; the CONTRIBUTING guide explicitly warns about accidentally staging many generated modifications — stage only intended `.mo` edits.

Integration points & external tools
- Recommended simulation environment: OpenModelica (mentioned in README). Other Modelica-compliant tools (Dymola, etc.) are supported but not provided here.
- CI expects `python` and the ModelicaSyntaxChecker moparser. If reproducing CI locally, clone https://github.com/modelica-tools/ModelicaSyntaxChecker and run the appropriate `moparser` binary.

How AI agents should operate here
- Before edits, scan [OpenIPSL/package.mo](OpenIPSL/package.mo) and the affected package `package.order` to understand public API expectations.
- For any change that affects model behavior or public API, run the repository syntax/encoding checks (see `.github/workflows/checkCI.yml`) and the deprecation checker in `.CI`.
- Prefer small, focused PRs that touch the minimal set of files for a single change; large sweeping changes are hard to review and often include unrelated tool noise.
- When modifying documentation, update Modelica annotations or UsersGuide entries rather than creating separate markdown docs unless requested.

Examples (commands to run locally)
```
python ./.CI/check_html.py tidyHTML ./OpenIPSL/
python ./.CI/check_html.py checkTags ./OpenIPSL/
python ./.CI/check_deprecated_line_color.py OpenIPSL
# clone Modelica syntax checker and run moparser locally
git clone --depth=1 https://github.com/modelica-tools/ModelicaSyntaxChecker
ModelicaSyntaxChecker/Linux64/moparser -v 3.4 -r OpenIPSL
```

If you find gaps or want me to include more examples (specific packages, common refactors, or typical test runs), tell me which areas to expand.

PR Labeling & Release Notes
- PRs are auto-labeled by [`.github/workflows/label-pr.yml`](.github/workflows/label-pr.yml) using Conventional Commit-style titles.
	- Examples: `feat: add new generator model` -> `feat`; `fix: correct parameter` -> `fix`; `docs: update UsersGuide` -> `docs`.
	- Breaking changes: include `!` in the title (e.g. `feat!: change interface`) or `!(scope):` to trigger the `breaking` label.
	- The workflow adds labels it detects to the PR (see the mapping in the workflow script).
- Release changelog grouping is configured in [`.github/release.yml`](.github/release.yml).
	- The changelog generator excludes PRs labeled `ignore-for-release` and contributions by `dependabot`.
	- Labels are mapped to categories (e.g., `feat` -> Features, `fix` -> Bug Fixes, `docs` -> Documentation). Keep PR labels aligned to these categories to ensure useful release notes.

Practical tips
- Use Conventional Commits in the PR title to get consistent labels and clean changelog entries.
- If a PR should be omitted from releases (internal chore/config only), add the `ignore-for-release` label.
- If you intend a breaking change, use the `!` indicator in the title so the `breaking` label is applied and the change surfaces in the BREAKING CHANGES section.

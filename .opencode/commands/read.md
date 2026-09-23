---
description: Audit workspace state, git diffs, routing, and localization keys
agent: orchestrator
model: anthropic/claude-sonnet-4-5#high
---

Audit and inspect the current project state.

### Diagnostic Audit:
1. **Git History & Working Tree**:
   !`git status --short && git log -n 5 --oneline`
2. **Directory & Route Inspection**:
   !`glob "**/*.tsx" "**/*.json" --limit 30`
3. **Localization Key Parity**:
   - Audit `src/locales/` to ensure key parity across all regional and global JSON files.
4. **Instruction Verification**:
   - Verify compliance with `AGENTS.md` design and mobile-first rules.
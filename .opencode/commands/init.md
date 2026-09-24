---
description: Initialize a new hyper-niche web utility project
agent: orchestrator
model: anthropic/claude-sonnet-4-5#high
---

Initialize a new openpixal hyper-niche web project for "$ARGUMENTS".

### Execution Steps:
1. **Git Isolation**:
   - Inspect status: !`git status --short`
   - Create a dedicated Git worktree or feature branch via `superpowers/using-git-worktrees` for "$ARGUMENTS".
2. **Socratic User Dialogue**:
   - Use the `question` tool to ask if this site is **India-Specific** (requiring Hindi, Tamil, Telugu, Marathi, Gujarati, Bengali) or **Global** (Spanish, French, German, Japanese, etc.).
   - Confirm target audience and core utility computation logic with the user.
3. **Scaffold & Configure**:
   - Set up Next.js App Router with localized routing `src/app/[locale]/`.
   - Configure Day/Night (dark/light mode) theme provider with auto-system detection.
   - Bind `i18n-locales` dictionary references.
4. **Agile Subagent Delegation**:
   - Delegate pSEO taxonomy to `seo-architect`.
   - Delegate mobile-first UI construction to `dev`.
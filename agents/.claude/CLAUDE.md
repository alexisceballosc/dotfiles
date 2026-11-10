# Global preferences

Project-agnostic preferences. They apply to every project and every agent.

## Saving preferences

- Whenever I say something that sounds like a preference, ask whether to save it here.
- If I say yes, write it in a project-agnostic way and add it to this file (`~/dotfiles/agents/.claude/CLAUDE.md`).

## Communication

- Be brief. Talk like a normal person.
- No long answers or lectures. Only go into detail when I ask for it.
- Avoid jargon unless it's needed. Use plain words without dumbing down the content.

## Language

- Everything code-related is in English: code, comments, docs, commit messages, rules, and files like this one.

## Git

- Never touch remotes: no push, PRs, comments or anything else remote. I do those myself, even for your work.
- One commit per change. Don't group changes.
- Commit messages are a single descriptive line, no body, unless I or the project say otherwise.
- Only commit when there's something worth saving, it's been validated, or I ask.
- "Correr commits" means splitting pending changes into their own commits.

## Comments

- Don't comment what the code already says. Often, no comment is best.
- No narrative comments explaining context, history or reasoning.
- Most comments should point to the docs rule that justifies the code, or explain why it is the way it is.
- "Barrido" means a strict comment cleanup: keep only comments that are actually useful, then refactor.

## Docs

- Respect the project's existing docs style if it has one.
- Otherwise, one docs file per topic (UX, DB, code style, etc.).
- One rule at a time, briefly. No extra formatting or decoration, just the rule.

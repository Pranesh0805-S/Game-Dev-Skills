# Getting Started

## 1. Pick where to run the skills

| Where | Best for | How |
|---|---|---|
| Claude Console / Claude apps | Chat-based design and review | Upload the zips under **Skills → Create skill** |
| Claude Code | Testing a real project, running tests, editing files | Copy the folders into `.claude/skills/` |

## 2. Install

### Console
```bash
cd skills
zip -r ../game-rules-core.zip game-rules-core
zip -r ../game-testing.zip game-testing
```
Upload each zip with **Create skill**. The folder name must match the `name` field in `SKILL.md`.

### Claude Code (global)
```bash
mkdir -p ~/.claude/skills
cp -r skills/game-rules-core skills/game-testing ~/.claude/skills/
```

### Claude Code (one project)
```bash
mkdir -p .claude/skills
cp -r path/to/game-dev-skills/skills/* .claude/skills/
```

## 3. First run

New game:
```text
Use game-rules-core. I'm building <genre> in <2D/3D, engine>. Write RULES.md first.
```

Existing game:
```text
Use game-rules-core to write RULES.md from the code in src/, then use game-testing to verify it.
```

Testing only:
```text
Use game-testing on this project and write BUG_REPORT.md.
```

## 4. Recommended workflow

1. `RULES.md` first, before code.
2. Keep physics constants in one config file.
3. Re-run `game-testing` after each feature.
4. When a rule changes, update `RULES.md` in the same commit.

## 5. Troubleshooting

| Problem | Fix |
|---|---|
| Skill does not trigger | Name it in the prompt: "Use game-testing" |
| Upload rejected | Zip the folder itself (so `SKILL.md` sits inside the folder), not just the files |
| `references/` not read | Keep the paths exactly as written in `SKILL.md` |
| Tests cannot run | Make sure dependencies are installed in the project |

# Contributing

## Ideas that help most
- New genre add-ons for `game-rules-core`
- More engine-specific checks (Unity, Godot, Phaser, Babylon.js) for `game-testing`
- Real, captured example reports

## Rules for changes
1. Keep `SKILL.md` under about 150 lines. Put detail in `references/`.
2. Every rule must carry a number or be testable.
3. Folder name must equal the `name:` in `SKILL.md`.
4. `description:` says what the skill does and when to use it.
5. Update the matching file in `docs/` in the same PR.

## Quick check
```bash
for d in skills/*/; do
  n=$(basename "$d")
  grep -q "^name: $n$" "$d/SKILL.md" && echo "ok  $n" || echo "BAD $n"
done
```

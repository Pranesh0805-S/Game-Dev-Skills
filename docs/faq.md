# FAQ

**Is this only for platformers?**
No. `game-rules-core` has universal rules plus add-ons for platformer, runner, shooter, puzzle and racing/3D. Other genres use the universal part and you define the rest in `RULES.md`.

**Does it work for 3D?**
Yes. The collision reference covers 3D colliders (sphere, capsule, mesh) and the testing checklist includes Three.js disposal and draw-call checks.

**Do I need both skills?**
No. `game-testing` works alone: if `RULES.md` is missing, it infers rules from the code first. Results are better with a real `RULES.md`.

**Will it fix bugs automatically?**
By design it reports first and fixes only on request.

**Can it play my game?**
Only if a browser-capable tool is available in your session. Otherwise it reviews code and runs tests, and says so in the report.

**How is this different from asking Claude "find bugs in my game"?**
The skills give a fixed process, a defined report format, a rule contract, and a requirement for evidence, so results are repeatable instead of ad hoc.

**Can I add my own genre?**
Yes: add a bullet under "Genre add-ons" in `skills/game-rules-core/SKILL.md` and send a PR.

**Are the example reports real?**
No. They are illustrative samples showing the format.

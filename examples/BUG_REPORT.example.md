# BUG_REPORT.md (illustrative example, not from a real run)

Project: Dino Run 3D · Rules checked: RULES.md (R-001 to R-010)

## Summary
| Severity | Count |
|---|---|
| Critical | 1 |
| Major | 2 |
| Minor | 1 |
| Polish | 0 |

## BUG-001 · Critical · Game over can fire twice (violates R-004)
**Steps**
1. Reach 1 life.
2. Touch a Cactus and fall below y = −10 m in the same frame.

**Expected:** one transition to GameOver, score frozen once.
**Actual:** `onGameOver()` runs twice, high score written twice and the menu opens twice.
**Evidence:** `src/game.js:142` and `src/game.js:171` both call `onGameOver()` with no state guard.
**Suggested fix:** guard with `if (state !== 'Playing') return;` at the top of `onGameOver()`.

## BUG-002 · Major · Coyote time too long (violates R-001)
**Steps:** walk off a ledge, wait 0.3 s, press Space.
**Expected:** no jump (limit 0.10 s).
**Actual:** jump succeeds.
**Evidence:** `src/player.js:88` has `coyoteTime = 0.4`.
**Suggested fix:** read the value from the constants config (0.10).

## BUG-003 · Major · Speed depends on frame rate (violates hard rule)
**Steps:** run the simulation at 30, 60 and 144 FPS for 10 s.
**Expected:** same distance travelled.
**Actual:** distance differs by 2.4× between 30 and 144 FPS.
**Evidence:** `src/player.js:61` adds `speed * 0.016` instead of `speed * dt`.
**Suggested fix:** use the fixed physics `dt`.

## BUG-004 · Minor · Coin geometry not disposed on restart
**Evidence:** `src/coins.js` removes meshes from the scene without `geometry.dispose()`.
**Suggested fix:** dispose geometry and material on removal.

## Not tested
- Gamepad input
- Audio
- Safari and iOS

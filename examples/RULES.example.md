# RULES.md (illustrative example)

## Overview
- Game: Dino Run 3D
- Dimension: 3D, third-person camera
- Genre: platformer / runner
- Library: Three.js
- Input: Space = jump, P = pause

## Constants
| Name | Value | Unit |
|---|---|---|
| gravity | -25.0 | m/s² |
| jump_velocity | 9.0 | m/s |
| run_speed_start | 8.0 | m/s |
| run_speed_max | 20.0 | m/s |
| speed_ramp | 0.2 | m/s per s |
| coyote_time | 0.10 | s |
| jump_buffer | 0.10 | s |
| invulnerable_after_hit | 1.5 | s |
| fall_death_y | -10.0 | m |
| physics_dt | 1/60 | s |

## States
`Boot → Menu → Playing ⇄ Paused → GameOver → Menu`

## Entities
| Entity | Collider | Layer | Notes |
|---|---|---|---|
| Player | capsule | Player | collides with World, Hazard (trigger) |
| Ground tile | box | World | solid |
| Cactus | box | Hazard | trigger, damages |
| Coin | sphere | Pickup | trigger, Player only |

## Rules
| ID | Trigger | Condition | Effect | Edge case |
|---|---|---|---|---|
| R-001 | Space pressed | grounded, or ≤ 0.10 s since leaving ground | vy = 9.0 m/s | press up to 0.10 s before landing still jumps |
| R-002 | Space released | vy > 0 | vy = vy × 0.5 | no effect while falling |
| R-003 | Player touches Cactus | not invulnerable | lives −1, invulnerable 1.5 s | touching during invulnerability does nothing |
| R-004 | lives = 0 | any | state → GameOver | score frozen at that frame |
| R-005 | Player y < −10 m | any | lives −1, respawn at last safe tile | if lives = 0 → GameOver |
| R-006 | Playing, each second | speed < 20 m/s | speed += 0.2 m/s | capped at 20.0 |
| R-007 | Player touches Coin | any | score += 10, coin removed | each coin counts once |
| R-008 | State = Paused | any | physics, timers, spawns, audio stop | input except P ignored |
| R-009 | Restart | any | score, lives, speed, spawns reset; high score persists | |
| R-010 | Obstacle spawn | spawn gap ≥ jump_distance(speed) + 1.0 m | spawn at 60 m ahead | seed from run seed, always passable |

## Win / lose / restart
- Win: none (endless).
- Lose: lives = 0.
- Persists: high score (localStorage, guarded against corrupt data).
- Resets: everything else.

## Out of scope
Audio mixing, settings menu.

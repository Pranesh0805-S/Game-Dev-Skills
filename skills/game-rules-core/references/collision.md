# Collision & Physics Reference

## Choose collider by need
| Need | 2D | 3D |
|---|---|---|
| Fast, simple | AABB | AABB / sphere |
| Rotating bodies | OBB / circle | OBB / capsule |
| Characters | box or capsule | capsule |
| Terrain | tilemap / polygon | heightmap / mesh (convex) |

## Pipeline
1. **Broad phase**: spatial hash / grid / quadtree / BVH to cut pair checks.
2. **Narrow phase**: exact test (AABB overlap, SAT, circle distance, raycast).
3. **Resolve**: push out along minimum translation vector, then zero velocity into the surface.
4. **Events**: fire `onEnter / onStay / onExit` once, not every frame.

## Classic bugs to design against
- **Tunneling** (fast object skips thin wall): use swept/continuous collision or raycast from previous to current position; cap max velocity.
- **Corner snagging**: resolve X and Y axes separately (2D); slightly round collider corners.
- **Jitter on ground**: use small ground-check ray/skin width, not exact zero overlap.
- **Stuck in geometry**: if overlap after resolve, push out by depenetration vector.
- **Moving platforms**: apply platform delta to riders before the rider's own movement.
- **Triggers vs solids**: triggers never block; solids never fire pickups. Keep layers/masks explicit.

## Layer matrix (define this table for every project)
| Layer | Collides with |
|---|---|
| Player | World, Enemy, Pickup(trigger), Hazard(trigger) |
| Enemy | World, Player |
| Projectile | World, Enemy/Player (by owner) |
| Pickup | Player only |

## Physics constants (write them down)
gravity, max fall speed, jump velocity, move speed, friction, air control. Keep in one config file so QA can tweak and test.

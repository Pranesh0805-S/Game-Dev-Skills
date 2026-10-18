# Common Game Bug Checklist

## Game loop and state
- [ ] Physics uses fixed dt or scales by delta time (no per-frame constants)
- [ ] Delta time clamped after tab switch (avoid giant dt spike)
- [ ] Pause really stops update, timers, and audio
- [ ] Restart resets ALL state (score, timers, spawners, velocities, flags)
- [ ] Game over cannot be triggered twice
- [ ] Event listeners not added again on every restart

## Input
- [ ] Keys stuck after window blur or pause
- [ ] Both left and right held cancels sensibly
- [ ] Jump can't be spammed to fly; buffering and coyote time behave as specified
- [ ] Menu clicks don't leak into gameplay

## Collision and physics
- [ ] Fast entity passes through thin objects
- [ ] Player sticks to walls or ceilings
- [ ] Falls through floor on low FPS
- [ ] Entity leaves bounds with no outcome
- [ ] Trigger fires every frame instead of once

## Spawning and memory
- [ ] Off-screen entities are removed
- [ ] Pooled objects fully reset when reused
- [ ] Geometry, materials, and textures disposed (Three.js `dispose()`)
- [ ] Array grows without bound

## Scoring and save
- [ ] Score updates once per event
- [ ] High score saved and loaded safely (try/catch on JSON.parse)
- [ ] Large numbers don't overflow display

## Web specifics
- [ ] Canvas resizes correctly with devicePixelRatio
- [ ] Audio starts only after a user gesture
- [ ] `requestAnimationFrame` loop cancelled on teardown
- [ ] Works on mobile touch and small viewports
- [ ] No console errors or 404 assets on load

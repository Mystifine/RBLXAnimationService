# AnimationService 🎬

[![Lua](https://img.shields.io/badge/language-Lua-2C2C2C)](https://www.lua.org/)  
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)  

A lightweight **animation management module for Roblox** that simplifies loading, caching, and playing animations with `Animator`. Perfect for keeping your animations efficient, organized, and easy to control.

---

## Why Use AnimationService?

Managing animations in Roblox can get messy with multiple `Animator`s and repeated loading. `AnimationService` handles caching, automatic cleanup, and provides a clean API for playing and stopping animations. Less boilerplate, more gameplay.

---

## Features

- **Automatic caching:** Animations are loaded once per `Animator` and reused, improving performance.  
- **Safe cleanup:** Automatically removes cached animations when the `Animator` is destroyed or removed from the hierarchy.  
- **Flexible playback:** Supports looped animations and priority settings via attributes.  
- **Simple API:** `getAnimation`, `playAnimation`, and `stopAnimation` methods for easy integration.

---

## Installation

Place `AnimationService.lua` in your Roblox project and require it where needed:

```lua
local AnimationService = require(path_to_AnimationService)
````

---

## Usage Example

```lua
local AnimationService = require(path_to_AnimationService)

-- Play an animation
local track = AnimationService.playAnimation(animator, animation)

-- Stop an animation
AnimationService.stopAnimation(animator, animation)
```

---

## API Reference

### `getAnimation(animator: Animator, animation: Animation) -> AnimationTrack`

Loads and caches an animation for the given animator.

### `playAnimation(animator: Animator, animation: Animation, ...) -> AnimationTrack`

Plays the cached animation. Accepts optional parameters for `AnimationTrack:Play()`.

### `stopAnimation(animator: Animator, animation: Animation, ...)`

Stops the cached animation. Accepts optional parameters for `AnimationTrack:Stop()`.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.


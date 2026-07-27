# RUMAHANTU

First-person 3D horror exploration game built with **Godot Engine 4.5** (GDScript).  
Original repository: [yassine-mathlouthi/3d-game-fps](https://github.com/yassine-mathlouthi/3d-game-fps)

---

## Project overview

| Item | Value |
|---|---|
| Engine | Godot 4.5 / GL Compatibility renderer |
| Language | GDScript |
| Main scene | `scenes/world.tscn` |
| Package name | `com.altomedia.rumahantu` |
| Target platforms | Android (primary), Desktop |
| Current version | v0.1.19 |

---

## Key scenes & scripts

| Path | Purpose |
|---|---|
| `scenes/world.tscn` | Root scene / game world |
| `scenes/player.tscn` | First-person player (camera, inventory UI, flashlight) |
| `scenes/touch_controllers.tscn` | Full mobile HUD: dual joystick + action buttons |
| `script/player/player.gd` | Player movement, camera look (mouse + touch), interaction |
| `script/ui/action_button.gd` | Reusable action button that fires an input action on touch |
| `script/inventory/Inventory.gd` | Autoload inventory singleton |
| `addons/virtual_joystick/` | Virtual joystick addon (DYNAMIC mode) |

---

## Mobile touch layout

```
┌──────────────────────────────────────────────────┐
│  [left half — MoveJoystick]  [right half — LookJoystick] │
│                                                  │
│  [Jump][Run]              [Flash][Inv][Use]       │
│      ⬤  (appears on touch)       ⬤  (appears on touch) │
└──────────────────────────────────────────────────┘
```

- **MoveJoystick** (left half, DYNAMIC) → `forward / back / left / right`
- **LookJoystick** (right half, DYNAMIC) → `look_up / look_down / look_left / look_right`
- All HUD elements are **~55 % opacity** so they don't obscure the scene.
- Action buttons (Jump, Run, Use, Inventory, Flashlight) sit above the thumb zones.

---

## Input actions (project.godot)

| Action | Default key | Touch |
|---|---|---|
| forward / back / left / right | WASD / ZQSD | MoveJoystick |
| look_left / look_right / look_up / look_down | — | LookJoystick |
| run | Shift | RunBtn |
| interact | E | UseBtn |
| Inventory | Tab | InvBtn |
| flash | F | FlashBtn |
| ui_accept (jump) | Enter | JumpBtn |

---

## Building the Android APK

### Option A — GitHub Actions (recommended, fully automated)

A GitHub Actions workflow at `.github/workflows/build-android.yml` builds the APK automatically on every push to `main`.

1. Push this repository to GitHub (or sync from Replit via Git)
2. The workflow downloads Godot headless + Android export templates, imports assets, and exports `rumahantu.apk`
3. Download the APK from **Actions → latest run → RUMAHANTU-apk** artifact
4. Tags matching `v*` also create a GitHub Release with the APK attached

> **Update `GODOT_VERSION`** in the workflow `env:` block if it doesn't match your Godot installation.

### Option B — Local / manual export

1. Download Godot (version matching `config/features` in `project.godot`)
2. Install Android export templates via Editor → Export Templates
3. Open this project and run **Project → Export → Android** (preset `Android` or `Android 2` already configured)
4. The signed APK will be exported as `rumahantu.apk`

### Export presets

| Preset | gradle build | Purpose |
|---|---|---|
| `Android` | ✅ yes | Full Gradle build — use locally |
| `Android 2` | ❌ no | Template-only build — used by CI |

---

## User preferences

- Game name: **RUMAHANTU**
- Android package: `com.altomedia.rumahantu`
- All touch controls should be slightly transparent (≈ 55 % opacity)
- Dual joystick layout: left = movement, right = camera look
- Action buttons above each joystick (small, non-intrusive)

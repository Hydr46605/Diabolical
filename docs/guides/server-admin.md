# Server Guide

## Compatibility

- data pack: `80`-`88`
- resource pack: `63`-`64`
- smoke target: Paper `1.21.11`
- namespace/prefix: `diabolical`, `diab.*`

## Install Check

```mcfunction
/reload
function diabolical:debug/status
function diabolical:config/status
```

Expect no command errors, enabled systems, profile gates, and Primer delivery.

## Controls

```mcfunction
function diabolical:config/disable/all
function diabolical:config/enable/all
function diabolical:config/status
```

## Balance Profiles

```mcfunction
function diabolical:config/profile/calm
function diabolical:config/profile/default
function diabolical:config/profile/hard
function diabolical:config/status
```

- `calm`: later pressure
- `default`: intended balance
- `hard`: earlier pressure

The selected profile persists across `/reload`.

```mcfunction
function diabolical:config/disable/mobs
function diabolical:config/enable/mobs
```

## Reset

```mcfunction
function diabolical:debug/reset_self
function diabolical:debug/reset_all
function diabolical:mobs/debug/stop_active
function diabolical:uninstall
```

Remove or disable the data pack after `uninstall` if the removal is permanent.

## Notes

- one court encounter at a time
- one collector encounter at a time
- altar rituals use nearest-player ownership

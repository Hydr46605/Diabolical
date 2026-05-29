# Server Guide

Diabolical is safe to install as a normal data pack. It does not need the
optional resource pack to run.

## Install Check

After installing the data-pack zip:

```mcfunction
/reload
function diabolical:debug/status
function diabolical:config/status
```

Expected result:

- status commands print without errors
- contracts, rituals, relics, and events are enabled
- new players receive an Infernal Primer

## Controls

Pause or resume systems without uninstalling:

```mcfunction
function diabolical:config/disable/all
function diabolical:config/enable/all
function diabolical:config/status
```

Reset state during tests:

```mcfunction
function diabolical:debug/reset_self
function diabolical:debug/reset_all
function diabolical:uninstall
```

If `uninstall` is meant to be permanent, remove or disable the data pack before
the next `/reload`.

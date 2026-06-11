# JSL Quality Science Durability

Replaces vanilla **linear** quality durability scaling with **configurable exponential** scaling for science packs and other tool items.

## What it does

In Factorio 2.0 with Quality enabled, science packs use tool durability as their research capacity. Vanilla scales this linearly per quality tier:

```text
tool_durability_multiplier = 1 + quality_level
```

This mod overrides [QualityPrototype.tool_durability_multiplier](https://lua-api.factorio.com/latest/prototypes/QualityPrototype.html) using a startup mod setting:

```text
multiplier = scaling_factor ^ quality_level
```

When the scaling factor is **1**, vanilla linear scaling is restored (`1 + quality_level`).

### Example (scaling factor = 3)

| Quality   | Level | Multiplier | Display |
|-----------|-------|------------|---------|
| normal    | 0     | 1          | 100%    |
| uncommon  | 1     | 3          | 300%    |
| rare      | 2     | 9          | 900%    |
| epic      | 3     | 27         | 2700%   |
| legendary | 5     | 243        | 24300%  |

Higher-quality agricultural science packs also gain proportionally longer spoil times.

## Mod setting

**Settings → Mod settings → Startup → Quality durability scaling factor**

- Default: `3`
- Range: `0.01` to `1000`
- Vanilla equivalent: `1` (linear +1 per quality level)

Startup settings apply when starting a **new game**.

## Scope

`tool_durability_multiplier` is global — this mod also affects **repair packs** and **armor** durability. There is no API to limit the change to science packs only.

## Requirements

- Factorio **2.0**
- **Quality** feature enabled (`quality` mod / Space Age expansion ownership)

## Local install

Copy or symlink this folder into your Factorio mods directory:

```sh
ln -s "$(pwd)" "$HOME/Library/Application Support/factorio/mods/jsl-quality-science-durability"
```

On Linux: `~/.factorio/mods/`  
On Windows: `%APPDATA%\Factorio\mods\`

## Packaging

```sh
git archive --format zip --prefix jsl-quality-science-durability/ --worktree-attributes --output jsl-quality-science-durability_0.1.0.zip HEAD
```

## Release automation

Pushes to `main` can publish via [semantic-release](https://github.com/semantic-release/semantic-release) and [semantic-release-factorio](https://github.com/fgardt/semantic-release-factorio). Set the `FACTORIO_TOKEN` repository secret for Mod Portal uploads.

# Dictionarry-Hub Database — English Patch

A automatically patched fork of the [Dictionarry-Hub/database](https://github.com/Dictionarry-Hub/database)
by [@Dictionarry-Hub](https://github.com/Dictionarry-Hub), intended for users who prefer
English audio as their primary language preference.

> **All credit for the original database goes to the Dictionarry-Hub team.**
> This fork exists solely to apply a narrow personal preference patch on top of their work.
> Please visit [dictionarry.dev](https://dictionarry.dev) and support the original project.

---

## What is this?

The [Dictionarry database](https://github.com/Dictionarry-Hub/database) is a collection of
quality profiles and custom formats for use with [Profilarr](https://github.com/Dictionarry-Hub/profilarr),
a configuration management platform for Radarr and Sonarr.

This fork tracks the upstream `stable` branch and automatically applies the following patch:

---

## Applied Patches

| File(s) | Change |
|---|---|
| `profiles/*.yml` | `language: must_original` → `language: must_english` |

**Why?** The original profiles default to `must_original`, which prioritizes the original
language of a title. This patch changes that to `must_english` for users whose primary
language is English and want English audio enforced across all profiles.

---

## How it stays up to date

A GitHub Actions workflow runs daily and:

1. Fetches new commits from the upstream `stable` branch
2. Merges them into this fork
3. Re-applies the patches above
4. Pushes the result back to this repository

If upstream and this fork are already in sync, no action is taken.

---

## Usage

Point Profilarr at this repository instead of the official database.
Everything else works identically — only the patched values differ.

---

## Disclaimer

This is an unofficial, independent fork. It is not affiliated with or endorsed by
Dictionarry-Hub. For issues with the underlying profiles or custom formats, please refer
to the [original repository](https://github.com/Dictionarry-Hub/database) and their
[documentation](https://dictionarry.dev).

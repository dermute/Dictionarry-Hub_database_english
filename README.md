# Dictionarry Database — Experimental x265 branch

> **Branch `experimental/x265-grouped-preference`.** This branch adds two experimental
> profiles on top of the German-variants fork. It is **not** merged into `v2` and is **not**
> covered by the nightly upstream sync — deploy from it deliberately.

## Hard grouped-x265 Efficient profiles

This branch adds **`1080p Efficient x265`** and its auto-generated German sibling
**`1080p Efficient x265 german`**, both forked from `1080p Efficient`. They flip the codec
preference: instead of favouring trusted x264 encodes (Dictionarry's default at 1080p), they
**prefer x265 — but only when the release has a real release group.**

- **The rule (hard preference):** any x265 release *with a (non-banned) release group* outranks
  **every** x264, including top-tier x264 groups. This is done with two group-gated source CFs,
  `1080p Bluray (x265)` (**1,900,000**) and `1080p WEB-DL (x265)` (**1,850,000**), scored above
  the real x264 ceiling — a premium x264 Bluray already stacks to ~1,581,000
  (`1080p Balanced Tier 1` 881,000 + `1080p Bluray (x264)` 700,000).
- **What stays rejected:** x265 with **no** release group. The x265 reward is gated on a release
  group being present, so a group-less x265 stays at `Banned Groups` = `-999999` (below the
  200,000 minimum) and is dropped. The notorious x265 re-encoders inherited from the base profile
  stay banned too: **MeGusta, PSA, NiCEHEVC, NaNi, NIMA4K, nikt0, pmHD, RARBG**.
- **x264 is not banned** — it keeps its normal score (above the minimum), so it's still an
  acceptable *fallback* when no grouped x265 exists; it just always ranks below grouped x265.
- **Curated x265 still wins the tie:** groups already tiered upstream (HONE, QxR, TAoE, NAN0, SQS,
  Vialle, Weasley) keep their existing scores *and* the new source bonus, so they rank highest
  among x265.
- **Known trade-off of "hard":** because the lowest grouped x265 (WEB, 1,850,000) exceeds the
  highest x264 (Bluray, ~1,581,000), a 1080p x265 **WEB-DL** will outrank a 1080p x264 **Bluray**.
  That's the direct consequence of "always beats x264." To soften, drop `1080p WEB-DL (x265)`
  below the x264 Bluray total (e.g. `1,550,000`) in
  [`ops/99999990.create-x265-efficient-profile.sql`](ops/99999990.create-x265-efficient-profile.sql).

All of the above lives in one idempotent migration,
[`ops/99999990.create-x265-efficient-profile.sql`](ops/99999990.create-x265-efficient-profile.sql),
which clones the base profile and applies the rescoring; the German sibling is produced
automatically by the German-variants migration described below.

---

# Dictionarry Database — German Variants Fork

Personal fork of [Dictionarry-Hub/database](https://github.com/Dictionarry-Hub/database) (branch `v2`) that keeps every upstream quality profile as-is **and** adds a German-language sibling for each one.

So upstream's `1080p Efficient` stays exactly as upstream ships it, and a new `1080p Efficient german` lives alongside it with:

- `language` set to **must German** instead of `must Original`.
- A **`Not German`** custom format scored **`-999999`** — this is what actually forces German (see below). Any release without a German audio track drops below the profile's `minimum_custom_format_score` and is rejected.
- The **`German DL`** custom format re-scored from `-999999` to **`+5000`**, so German dual-language releases are not only allowed but nudged above the floor.
- **`Not Original or English`** re-scored from `-999999` to `0`, so German dubs aren't rejected for lacking the original/English track.
- **`Banned Language Groups`** and **`Banned Dual Audio Groups`** re-scored from `-999999` to `0` — those upstream bans target dual/foreign audio, which is exactly what a German profile wants. (`Banned Groups (Release Title)` is left enforcing, since it bans for quality/scene reasons.)
- Every other custom-format score, quality tier, tag and upgrade rule copied verbatim from the upstream profile.

The variants are produced by a single SQL migration file ([`ops/99999999.create-german-variants.sql`](ops/99999999.create-german-variants.sql)). The migration is idempotent (`WHERE NOT EXISTS` guards everywhere), so replaying it against an existing database is a no-op.

### How German is actually forced

The profile's `must German` language field is only enforced by **Radarr** — **Sonarr treats it as advisory** and will happily grab non-German releases. Upstream sidesteps this for original/English by using the `Not Original or English` custom format at `-999999` (anything matching falls under `minimum_custom_format_score` and is rejected in *both* arrs). Because our fork neutralises that CF to `0`, it adds the mirror image — `Not German` at `-999999` — so non-German releases are rejected in Radarr **and** Sonarr. German and German-DL releases contain a German track, don't match, and pass untouched.

> **Note:** this is deliberately strict. A release that Sonarr can't confirm as German (e.g. detected as `Unknown`) is also rejected — the same tradeoff upstream accepts for original/English.

## How the nightly sync works

A scheduled GitHub Actions workflow ([`.github/workflows/sync-upstream.yml`](.github/workflows/sync-upstream.yml)) runs every night at 03:17 UTC and:

1. Adds the upstream as a git remote.
2. Fetches and merges `upstream/v2` into our `v2` (with `-X ours`, so any upstream change that conflicts with our customisations is resolved in favour of *our* state — most relevant for the deletion of upstream's own workflow files).
3. Re-deletes `.github/workflows/notify.yml` and `.github/workflows/devSync.yml` if the merge somehow brought them back.
4. Pushes the merged result back to `origin/v2`.

You can also trigger it manually from the Actions tab via *Run workflow*.

## Upstream workflows are disabled here

Two upstream workflows are unwanted in this fork:

| Workflow                              | Why it's stripped                                                                 |
| ------------------------------------- | --------------------------------------------------------------------------------- |
| `.github/workflows/notify.yml`        | Pings upstream's `Dictionarry-Hub/parrot` notifier on every push — irrelevant here.|
| `.github/workflows/devSync.yml`       | Syncs upstream's internal `dev` branch from `stable` — meaningless for us.        |

They are removed in our `v2` branch, and the nightly sync re-strips them if they ever come back. As an extra safety net, GitHub disables Actions in newly-created forks by default — only `sync-upstream.yml` needs to be explicitly enabled.

## Adjusting the German variants

The behaviour of the German variants is determined entirely by `ops/99999999.create-german-variants.sql`. To change the policy, edit that single file and commit — for example:

- **Loosen the language gate:** lower the `Not German` score (step 10b) from `-999999`, or drop the block entirely to fall back to the (Radarr-only) `must German` field.
- **Tune the `German DL` reward:** change the `+5000` in the step 9 `CASE`.
- **Re-ban a group set:** remove `Banned Language Groups` / `Banned Dual Audio Groups` from the step 9 `CASE` so they keep their upstream `-999999`.
- **Switch language type** from `must` to `simple` in step 8.

## Credit

Everything good here is upstream's work. This fork is just a thin language-localisation layer on top of [Dictionarry](https://dictionarry.dev).

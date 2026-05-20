# Dictionarry Database — German Variants Fork

Personal fork of [Dictionarry-Hub/database](https://github.com/Dictionarry-Hub/database) (branch `v2`) that keeps every upstream quality profile as-is **and** adds a German-language sibling for each one.

So upstream's `1080p Efficient` stays exactly as upstream ships it, and a new `1080p Efficient german` lives alongside it with:

- `language` set to **must German** instead of `must Original`.
- The `German DL` custom format re-scored from `-999999` to `0`, so German dual-language releases are no longer rejected.
- Every other custom-format score, quality tier, tag and upgrade rule copied verbatim from the upstream profile.

The variants are produced by a single SQL migration file ([`ops/99999999.create-german-variants.sql`](ops/99999999.create-german-variants.sql)). The migration is idempotent (`WHERE NOT EXISTS` guards everywhere), so replaying it against an existing database is a no-op.

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

The behaviour of the German variants is determined entirely by `ops/99999999.create-german-variants.sql`. To change the policy (e.g. switch language type from `must` to `simple`, or pick a different `German DL` score), edit that single file and commit.

## Credit

Everything good here is upstream's work. This fork is just a thin language-localisation layer on top of [Dictionarry](https://dictionarry.dev).

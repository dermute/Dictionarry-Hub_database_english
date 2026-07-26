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

## AI attribution

This project was developed with AI assistance.

<div style="display: flex; align-items: center; white-space: nowrap; gap: 0.5rem; padding: 8px;">
  <div style="font-family: IBM Plex Sans; font-weight: 400; font-size: 16px; line-height: 22px; letter-spacing: 0px;">
    <a rel="noopener noreferrer" href="https://aiattribution.github.io/statements/AIA-EAI-Hin-Nr-?model=Opus%204.8-v1.0" data-cy="recommended-attribution-statement-text" target="_blank" style="font-family: IBM Plex Sans; font-weight: 400; font-size: 16px; line-height: 22px; letter-spacing: 0px;">AIA EAI Hin Nr Opus 4.8 v1.0 </a>
  </div>
  <div style="display: flex; gap: 0.5rem;">
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
      <g clip-path="url(#clip0_50_2)">
        <path d="M12 23.5C18.3513 23.5 23.5 18.3513 23.5 12C23.5 5.64873 18.3513 0.5 12 0.5C5.64873 0.5 0.5 5.64873 0.5 12C0.5 18.3513 5.64873 23.5 12 23.5Z" fill="#4E4E4E" stroke="#161616">
        </path>
        <path d="M13.6471 15.6L13.1471 13.94H10.8171L10.3171 15.6H8.77715L11.0771 8.61998H12.9571L15.2271 15.6H13.6471ZM11.9971 9.99998H11.9471L11.1771 12.65H12.7771L11.9971 9.99998Z" fill="white">
        </path>
      </g>
      <defs>
        <clipPath id="clip0_50_2">
          <rect width="24" height="24" fill="white">
          </rect>
        </clipPath>
      </defs>
    </svg>
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M18 17H16.5V16H18V8H16.5V7H18C18.2651 7.0003 18.5193 7.10576 18.7068 7.29323C18.8942 7.4807 18.9997 7.73488 19 8V16C18.9996 16.2651 18.8942 16.5193 18.7067 16.7067C18.5193 16.8942 18.2651 16.9996 18 17Z" fill="#161616">
      </path>
      <path d="M15.5 13C16.0523 13 16.5 12.5523 16.5 12C16.5 11.4477 16.0523 11 15.5 11C14.9477 11 14.5 11.4477 14.5 12C14.5 12.5523 14.9477 13 15.5 13Z" fill="#161616">
      </path>
      <path d="M12 13C12.5523 13 13 12.5523 13 12C13 11.4477 12.5523 11 12 11C11.4477 11 11 11.4477 11 12C11 12.5523 11.4477 13 12 13Z" fill="#161616">
      </path>
      <path d="M8.5 13C9.05228 13 9.5 12.5523 9.5 12C9.5 11.4477 9.05228 11 8.5 11C7.94772 11 7.5 11.4477 7.5 12C7.5 12.5523 7.94772 13 8.5 13Z" fill="#161616">
      </path>
      <path d="M7.5 17H6C5.73488 16.9997 5.4807 16.8942 5.29323 16.7068C5.10576 16.5193 5.0003 16.2651 5 16V8C5.00026 7.73486 5.10571 7.48066 5.29319 7.29319C5.48066 7.10571 5.73486 7.00026 6 7H7.5V8H6V16H7.5V17Z" fill="#161616">
      </path>
      <circle cx="12" cy="12" r="11.5" stroke="#161616">
      </circle>
      <circle cx="12" cy="12" r="11.5" stroke="#161616">
      </circle>
    </svg>
    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="12" cy="12" r="11.5" stroke="#161616">
      </circle>
      <path d="M10 6C10.4945 6 10.9778 6.14662 11.3889 6.42133C11.8 6.69603 12.1205 7.08648 12.3097 7.54329C12.4989 8.00011 12.5484 8.50277 12.452 8.98773C12.3555 9.47268 12.1174 9.91814 11.7678 10.2678C11.4181 10.6174 10.9727 10.8555 10.4877 10.952C10.0028 11.0484 9.50011 10.9989 9.04329 10.8097C8.58648 10.6205 8.19603 10.3 7.92133 9.88893C7.64662 9.4778 7.5 8.99445 7.5 8.5C7.5 7.83696 7.76339 7.20107 8.23223 6.73223C8.70107 6.26339 9.33696 6 10 6ZM10 5C9.30777 5 8.63108 5.20527 8.0555 5.58986C7.47993 5.97444 7.03133 6.52107 6.76642 7.16061C6.50151 7.80015 6.4322 8.50388 6.56725 9.18282C6.7023 9.86175 7.03564 10.4854 7.52513 10.9749C8.01461 11.4644 8.63825 11.7977 9.31718 11.9327C9.99612 12.0678 10.6999 11.9985 11.3394 11.7336C11.9789 11.4687 12.5256 11.0201 12.9101 10.4445C13.2947 9.86892 13.5 9.19223 13.5 8.5C13.5 7.57174 13.1313 6.6815 12.4749 6.02513C11.8185 5.36875 10.9283 5 10 5Z" fill="#161616">
      </path>
      <path d="M15 19H14V16.5C14 15.837 13.7366 15.2011 13.2678 14.7322C12.7989 14.2634 12.163 14 11.5 14H8.5C7.83696 14 7.20107 14.2634 6.73223 14.7322C6.26339 15.2011 6 15.837 6 16.5V19H5V16.5C5 15.5717 5.36875 14.6815 6.02513 14.0251C6.6815 13.3687 7.57174 13 8.5 13H11.5C12.4283 13 13.3185 13.3687 13.9749 14.0251C14.6313 14.6815 15 15.5717 15 16.5V19Z" fill="#161616">
      </path>
      <path d="M19.9592 9.99025L19.3932 9.42432L17.938 10.8796L16.4827 9.42432L15.9167 9.99025L17.372 11.4455L15.9167 12.9008L16.4827 13.4667L17.938 12.0115L19.3932 13.4667L19.9592 12.9008L18.5039 11.4455L19.9592 9.99025Z" fill="#161616">
      </path>
    </svg>
  </div>
</div>

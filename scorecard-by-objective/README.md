# Goal Metrics — Grouped by Objective (Tableau Dashboard Extension)

A variant of the goal-metrics scorecard that **groups metrics under objective-category
headers** and has **no sort dropdown**. Otherwise identical: progress bars, red/amber/green
status pills, objective filter, linked detail card with pace chart, lead metrics, trend chart.

This is a **separate** extension from `tableau-scorecard-extension` — different manifest ID
(`com.smartmetrix.goalscorecard.byobjective`) and its own local server port (**8766**), so the
two can be installed side by side without clashing.

## Files
- `index.html` — the whole extension.
- `scorecard-by-objective.trex` — the "installer" you point Tableau at.
- `start-server.cmd` — double-click to run the local server (port 8766).
- `tableau.extensions.1.latest.js` — the Tableau library, served locally.

## What's different from the original
- **No sorting** — the sort dropdown is removed.
- **Grouped by objective** — rows are grouped under an uppercase objective-category header.
  Grouping uses the same `Objective` field the filter uses (put it on Sheet 2's Rows).
  If no Objective field is present, it falls back to a plain flat list.

## Run it (local testing)
1. Double-click `start-server.cmd` (serves at http://localhost:8766). Leave it open.
2. In Tableau, add an **Extension** object to a dashboard → **Access Local Extensions** →
   pick `scorecard-by-objective.trex`.

## Data
Reads the same worksheets as the original (see that project's README): a main scorecard sheet
(Metric, Annual Goal, Baseline, Progress to Goal, Expected Progress, Current Value, Status,
**Objective**), an optional Lead Metrics sheet, and an optional Trend sheet.

## Publishing to Tableau Cloud
Same process as the original: host these files on HTTPS (e.g. GitHub Pages), update the
`<url>` in `scorecard-by-objective.trex` to the hosted address, and have a site admin add the
host to **Settings → Extensions → Dashboard Extensions** with "Allow full data access".

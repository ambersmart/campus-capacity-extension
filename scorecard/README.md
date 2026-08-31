# Goal Metrics — Executive Scorecard (Tableau Dashboard Extension)

A custom scorecard for your Tableau dashboard: progress bars, red/amber/green status
pills, and a linked detail card with a goal-pace line chart.

## Files
- `index.html` — the whole extension (design + logic). Nothing else to edit for now.
- `scorecard.trex` — the "installer" file you point Tableau at.
- `start-server.cmd` — double-click to start the little local web server.

---

## How to run it (5 steps)

1. **Start the server.** Double-click `start-server.cmd`. A black window opens and stays open —
   that's the server. Leave it running while you use the extension. (To stop later, close that window.)

2. **Open your dashboard** in Tableau Desktop. Put the worksheet with your metrics on it.

3. On the left, under **Objects**, drag **Extension** onto your dashboard.

4. In the pop-up, click **Access Local Extensions** (bottom), then choose the file
   `scorecard.trex` from this folder. Click **OK / Allow** if Tableau asks for permission.

5. The scorecard appears. It shows **sample data** first, then tries to read your worksheet.

---

## Making it show YOUR data

The extension reads the first worksheet on the dashboard (or one whose name contains
"scorecard", "metric", or "goal"). For it to map correctly, your worksheet's fields
should include these column names (spaces/caps don't matter):

| What it needs | Field name can be… | Required? |
|---------------|--------------------|-----------|
| Metric name   | Metric, Category, Name | **Yes** |
| Current value | Current, Actual, Value | **Yes** |
| Goal          | Goal, Target, Annual   | **Yes** |
| Owner         | Owner, Lead            | Optional |
| Baseline      | Baseline, Start        | Optional |
| Status        | Status                 | Optional (auto-calculated if missing) |

If it can't find Metric + Current + Goal, it keeps showing sample data and tells you at
the bottom of the card. Send me your real field names and I'll match them exactly.

**Note:** the extension also un-stacks Tableau's **Measure Names / Measure Values** format,
so your measures can be melted into Measure Values (like Sheet 2) and it still works. If a
worksheet has no "Current Value", Current is calculated from `Baseline + Progress to Goal`.

---

## Lead metrics (the small indicators on the detail card)

Lead metrics live on their **own worksheet** added to the same dashboard — don't put them on
the main scorecard sheet. Build a worksheet with these four fields:

| Field | What it is | Example |
|-------|-----------|---------|
| **Metric Category1** | parent metric — use the *same field* as the scorecard so they match | Metric One |
| **Lead Metric** | name of the leading indicator | Lead measure 1 |
| **Lead Current** | current value | 2 |
| **Lead Goal** | target | 9 |

Steps:
1. New worksheet → drag **Metric Category1** and **Lead Metric** onto Rows.
2. Drag **Lead Current** and **Lead Goal** onto the sheet (Measure Values is fine).
3. Drop this worksheet onto the **same dashboard** (tuck it in a corner or float it aside).
4. Reload the extension.

Display is automatic: **goal ≤ 12 → dots**, larger goals → a progress bar. The parent name
must match the scorecard exactly (easiest: use the same `Metric Category1` field).

---

## Trend chart (the monthly line on the detail card)

By default the chart *fakes* the timeline, because the scorecard sheet only carries totals.
To make the line follow your real months, add a **Trend worksheet** to the same dashboard:

| Field | What it is | Example |
|-------|-----------|---------|
| **Metric Category1** | parent metric — same field as the scorecard | Metric One |
| **Month** | a real **date** field, one row per month you have | Aug 2026, Sep 2026, Oct 2026 |
| **Actual** | the value that month | 179, 181, 183 |

Steps:
1. New worksheet → drag **Metric Category1** and your **Month** date field onto Rows, and **Actual** onto the sheet.
2. **Important:** Month must be a real **date** (a green/continuous "Month" date carries year + month),
   not a text month name like "August" — the extension reads the actual date to place each point.
3. Drop the worksheet onto the **same dashboard** (tuck it away) and reload.

The chart then plots your real points, the line ends at your last month, and the month axis
starts at your earliest month. The dashed pace line still runs from Baseline to Goal.

---

## Hosting & publishing to Tableau Cloud

This extension is hosted on **GitHub Pages**:
`https://ambersmart.github.io/tableau-scorecard-extension/index.html`
and `scorecard.trex` already points at that URL. To update the extension later, edit the
files, commit, and push — GitHub Pages redeploys automatically.

To use it in a workbook you'll publish to **Tableau Online (Cloud)**:
1. In Tableau Desktop, add the **Extension** object to your dashboard → **Access Local
   Extensions** → choose `scorecard.trex` (now points to the hosted URL).
2. Publish the workbook to Tableau Online.
3. **Site admin step (one-time):** Tableau Online → **Settings → Extensions** → add
   `ambersmart.github.io` to the allowed list with **Allow full data access** (it reads
   worksheet summary data).

## Local development
- `start-server.cmd` runs a local copy at `http://localhost:8765` for testing changes before
  you push them live. Not needed once hosted, but handy for edits.

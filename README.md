# Campus Capacity & Service Strategy — Tableau Dashboard Extension

A Tableau **dashboard extension** that turns campus seat / attendance data into a
"where do we add a service?" decision tool for a multi-campus church.

Three views:

1. **Fill Grid** — every campus and service with attendance, seats, and fill %, color-coded
   against the **new full thresholds**: prime Sunday-morning hours (9–11am) are full at **70%**
   (was 80%); every other service is full at **40%**.
2. **Campus Scorecards** — per campus: seats (one service), prime service hours, total services,
   and a **growth-trigger flag** when a prime service holds ≥70% for 4 of the last 5 weeks.
3. **Network Roll-up** — total seats, total prime hours, and total services across all campuses —
   the baseline numbers for the "do we have plans to grow in the next 6–12 months?" conversation.

A **Time window** selector (Last Sunday / 4-week avg / 5-week avg) always states which weeks the
percentages come from — so a packed week never hides inside an average.

## Data it expects

One worksheet on the same dashboard, with these columns (matched loosely, so small
naming differences still work):

| Column | Used for |
|--------|----------|
| Campus Name | grouping |
| Sunday Date | the week (for windows + streaks) |
| Service | service name — day + time drive prime detection |
| Attendance | people counted |
| Capacity Auditorium | seats (one service) |
| % Adult Capacity | fallback fill % if capacity is missing |

**Prime** = a service that starts Sunday between 9:00 and 11:00am.
**Fill %** = attendance ÷ auditorium seats for the selected window.

## Files

| File | What it is |
|------|------------|
| `index.html` | The extension (design + logic). |
| `capacity-strategy.trex` | The manifest you add in Tableau (points to GitHub Pages). |
| `capacity-strategy.local.trex` | Local-testing manifest (points to `localhost:8772`). |
| `start-server.cmd` | Serves this folder at `http://localhost:8772` for local testing. |
| `tableau.extensions.1.latest.js` | Official Tableau Extensions API library (saved locally). |

## Hosted location (GitHub Pages)

`capacity-strategy.trex` points to:

```
https://ambersmart.github.io/campus-capacity-extension/index.html
```

Push this repo to GitHub and enable Pages (Settings → Pages → deploy from `main`). Edit → commit → push redeploys automatically.

## How to load it in Tableau Desktop

1. In a dashboard, drag an **Extension** object onto the canvas.
2. Choose **Access Local Extensions** and pick the `.trex` file.
3. The extension appears. With no live worksheet it shows built-in sample data so you can see the design.

## Local testing (before pushing)

Double-click `start-server.cmd`, then in Tableau point the extension at
`capacity-strategy.local.trex` (or open `http://localhost:8772/index.html` in a browser to preview the look).

## Tuning the thresholds

The two full lines live at the top of the `<script>` in `index.html`:

```js
const PRIME_FULL = 70;   // prime Sunday-morning services are "full" at 70%
const OTHER_FULL = 40;   // every other service is "full" at 40%
```

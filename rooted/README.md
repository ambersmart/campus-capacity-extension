# Rooted Effectiveness — Tableau Dashboard Extension

A Tableau dashboard extension that visualizes the effectiveness of a "Rooted" discipleship program:
milestones (when first steps happen), before→after lift & durability, and Life Group retention.

Built by [SmartMetrix](https://smartmetrixdata.com).

## Files

| File | Purpose |
|------|---------|
| `index.html` | The extension UI (hosted on GitHub Pages). |
| `rooted.trex` | Manifest for the **published** extension — points at the GitHub Pages URL. Load this in Tableau. |
| `rooted.local.trex` | Manifest for **local testing** — points at `http://localhost:8770`. |
| `start-server.cmd` | Serves this folder at `http://localhost:8770` for local testing. |

## Data & privacy

All figures shown in `index.html` are **sample data for layout only — not real client data.**
When loaded as an extension in Tableau, the charts are meant to bind to live worksheet data via the
Extensions API (`getSummaryDataAsync`).

## Use in Tableau

1. In Tableau Desktop, drag an **Extension** object onto a dashboard.
2. Choose `rooted.trex` (published) or `rooted.local.trex` (local testing).
3. On Tableau Cloud/Server, a site admin must allow `ambersmart.github.io` under
   **Settings → Extensions**.

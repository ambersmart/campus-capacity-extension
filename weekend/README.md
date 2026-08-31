# Weekend Attendance — Tableau Extension

A dashboard extension that reads the **Weekly Attendance** worksheet and rebuilds
the client's weekend report: grand total, adults/kids, per-campus and per-service
breakdown, with **last-weekend** and **prior-year-same-week** comparisons.

**Save as PDF:** click the download icon in the bottom-right of the black header. Tableau
can't export extensions to PDF, so the extension makes its own — it opens a print-ready
copy in a new tab and launches Save-as-PDF. (If nothing opens, allow pop-ups and retry.)

## Files
- `WeekendAttendance.trex` — the manifest you drag into a Tableau dashboard.
- `index.html` — the whole extension (design + logic in one file).
- `icon.png` — the tile icon.

## How to add it in Tableau

The extension is hosted on GitHub Pages, so there's **nothing to run** — no local server.

1. Open your workbook. Make sure the dashboard contains the **Weekly Attendance** sheet
   (it can be tucked off to the side — the extension reads it, it doesn't need to be visible).
2. In the dashboard, drag **Objects → Extension** onto the canvas.
3. Choose **Access Local Extensions** and pick `WeekendAttendance.trex`.
4. It reads the sheet and draws the report. It re-draws automatically when filters change.

Works on Tableau Desktop, Server, and Cloud.

- Hosted page: https://ambersmart.github.io/flatirons-weekend-attendance/
- Repo: https://github.com/ambersmart/flatirons-weekend-attendance

To update the look or logic later, edit `index.html`, commit, and push — the live
extension updates automatically (Tableau may need a refresh).

## Nothing to add on the Tableau side
All the comparison math (last weekend, prior year, %, discontinued services) is done
inside the extension from the sheet's own data. No new calculated fields needed.

It expects these fields on the sheet (already there): Campus Name, Service Time Name,
Age Range Name (group) → Adults/Kids, Sunday Date, Week Of Year, Y Value.
To point at a differently-named sheet, change `WORKSHEET_NAME` near the top of the
`<script>` in `index.html`.

## Publishing later (Server / Cloud / sharing)
Local `.trex` works on Desktop only. To use it on Tableau Server/Cloud, host `index.html`
somewhere (e.g. GitHub Pages) and change the `<url>` in `WeekendAttendance.trex` from the
`file:///…` path to your `https://…/index.html` URL.

# Trimester Attendance — Tableau Extension

Shows **average weekly attendance by campus**, comparing three periods:
**current trimester**, **prior trimester**, and **same trimester last year**.
No service-level detail — campus totals only, sorted highest → lowest.

## Files
- `TrimesterAttendance.trex` — the manifest you drag into a Tableau dashboard.
- `index.html` — the whole extension (design + logic).
- `icon.png` — the tile icon.

## How to add it in Tableau
Hosted on GitHub Pages — nothing to run.
1. Put the **Trimester Attendance** sheet on a dashboard (it can be tucked off to the side).
2. Drag **Objects → Extension** onto the dashboard.
3. Choose **Access Local Extensions** and pick `TrimesterAttendance.trex`.

Works on Tableau Desktop, Server, and Cloud.

- Hosted page: https://ambersmart.github.io/flatirons-trimester-attendance/
- Repo: https://github.com/ambersmart/flatirons-trimester-attendance

## Board-ready PDF
Tableau renders every dashboard extension **blank** in its own PDF/PowerPoint exports
(a platform limitation). So the extension makes its own PDF instead:

**Click the “Download as PDF” button** (bottom-right of the extension). It opens a
print-ready copy of the report in a new tab and launches your browser’s print dialog —
choose **Save as PDF**. (If nothing opens, allow pop-ups for the site and click again.)

Fallback if pop-ups are blocked: the companion page
**https://ambersmart.github.io/flatirons-trimester-attendance/print.html** builds the
same PDF from a CSV crosstab (Tableau → Download → Crosstab → CSV), all in your browser.

## How the numbers work
- **Avg weekly** is read straight from the sheet's `Avg Weekly Value`
  (= total attendance ÷ number of weeks in the period). The sheet's year-to-date
  filter keeps a partial current trimester comparable to the same slice of past ones.
- A **trimester** is 4 months: T1 = Jan–Apr, T2 = May–Aug, T3 = Sep–Dec (from the
  sheet's Trimester Label). "Same trimester last year" = same T number, prior year.
- **Excludes Leaders** (KM leaders / subs) to match the weekend report. To include
  every age group, edit `EXCLUDE_AGE` near the top of the `<script>` in `index.html`.

Expects these fields on the sheet (already there): Trimester Label, Campus Name,
Age Range Name (group), and the Avg Weekly Value measure.

# Campus Pinchpoint Dashboard — Tableau Dashboard Extension

A Tableau **dashboard extension** that shows average weekly attendance (AWA) vs. room
capacity for a multi-campus church, with a weekend "stoplight" view (green / yellow / red
against each service's soft cap).

**Status: Step 1 — the look.** Right now the extension displays built-in sample data so you
can drop it into a Tableau dashboard and see the full design working. Step 2 will wire it to
live worksheet data.

## Files

| File | What it is |
|------|------------|
| `index.html` | The dashboard itself (design + logic). |
| `pinchpoint.trex` | The manifest — the file you add inside Tableau to load the extension. |
| `tableau.extensions.1.latest.js` | Official Tableau Extensions API library (saved locally so it always loads). |
| `start-server.cmd` | Serves this folder at `http://localhost:8767` for local testing. |

## Hosted location (GitHub Pages)

`pinchpoint.trex` points to:

```
https://ambersmart.github.io/pinchpoint-dashboard-extension/index.html
```

Edit → commit → push redeploys automatically.

## How to load it in Tableau Desktop

1. In a dashboard, drag an **Extension** object onto the canvas.
2. Choose **Access Local Extensions** and pick `pinchpoint.trex`.
3. The dashboard appears.

## To run on Tableau Cloud / Server

A site admin must allow `ambersmart.github.io` under **Settings → Extensions**.

## Local testing (before pushing)

Double-click `start-server.cmd`, then in Tableau point the extension at
`http://localhost:8767/index.html` (or just open that URL in a browser to preview the look).

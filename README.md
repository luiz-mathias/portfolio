# Luiz Henrique Mathias · Portfolio

Personal portfolio site: strategy, digital transformation, and product leader; MBA candidate at Carnegie Mellon's Tepper School of Business (class of 2027).

**Live site:** https://luizmathias.vercel.app

## What's here

| File | Purpose |
| --- | --- |
| `index.html` | The whole site: one static page, no build step or dependencies |
| `deploy-vercel.ps1` | Deploys `index.html` to Vercel through the REST API (PowerShell, no Node needed) |
| `push-github.ps1` | Uploads files to this repo through the GitHub REST API (no Git needed) |
| `CLAUDE.md` | Project instructions and preferences that Claude Code loads each session |
| `logs/` | Session logs, one file per session named `YYYY-MM-DD_session-log.md` (add `-2`, `-3` for more than one per day) |

## Run locally

Open `index.html` in any browser.

## Deploy

```powershell
.\deploy-vercel.ps1 -TokenFile "$env:USERPROFILE\.vercel-token"
```

The script reads a Vercel access token from a local file (never committed) and publishes a production deployment to the `luizmathias` project.

Built with Claude Code for 45-884 AI Methods for Social and Visual Data, Carnegie Mellon University.

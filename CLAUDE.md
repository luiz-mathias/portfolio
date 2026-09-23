# CLAUDE.md · Portfolio project

Personal portfolio site for Luiz Henrique Mathias, built for 45-884 AI Methods for Social and Visual Data (CMU Tepper).

- Live: https://luizmathias.vercel.app (Vercel project `luizmathias`)
- Repo: https://github.com/luiz-mathias/portfolio (public)

## Project layout

| Path | Purpose |
| --- | --- |
| `index.html` | The whole site. One static page, no build step, no dependencies beyond Google Fonts |
| `deploy-vercel.ps1` | Deploys `index.html` to Vercel production via REST API |
| `push-github.ps1` | Uploads files to the GitHub repo via REST API (creates the repo if missing) |
| `logs/` | Dated session logs |

## Environment

- Windows, PowerShell 5.1. **No Git, Node, npm, or Vercel CLI installed.** Do not assume them; publish through the Vercel and GitHub REST APIs with the scripts above.
- `.\deploy-vercel.ps1 -TokenFile <path>` then `.\push-github.ps1 -TokenFile <path> -Files @("index.html", ...) -Message "..."`.
- After any deploy or push, verify from a logged-out request (HTTP 200 on the site, public raw file on GitHub) before reporting success.

## Preferences

**Writing**
- Never use em dashes (—) in anything written as Luiz, including site copy and logs. Avoid en dashes in prose. Follow the `my-writing-style` skill.
- Site copy is first person, warm and direct, outcome-first (numbers before descriptions).

**Site content**
- Sources: the CVs are the source of truth; LinkedIn adds early career, skills, and certifications. Where they conflict, follow the CV and flag the conflict to Luiz rather than guessing.
- Audience: recruiters from strategy consulting, tech/product, and corporate strategy in industry. Keep the "Where I fit" framing for all three.
- Public contact: Tepper email and LinkedIn only. No phone number, no personal (Hotmail) address.
- Left out on purpose: NLP Master Practitioner certification. Ask before adding.
- Keep `index.html` self-contained, responsive to phone width, and working in light and dark mode.

**Secrets**
- Luiz saves access tokens in local files; never ask him to paste a token into chat, and never print a token's value (check length/prefix only).
- Tokens live outside the project folder. Never commit or upload them; `.gitignore` blocks token files as a backstop.
- Recommend narrow scope and short expiry, and remind him to revoke tokens after use.

**Persistence and logs**
- Anything Luiz may need later goes to the GitHub repo so he can retrieve it from any machine or day, not only to local files or the session scratchpad.
- Session logs: `logs/YYYY-MM-DD_session-log.md` (suffix `-2`, `-3` for more than one per day). Header carries a timestamp with local time and UTC offset plus a Log ID matching the filename. Push each new log to GitHub.
- When preferences change, update this file and push it.

## Open items

- Reconcile LinkedIn vs CV: Cast Group dates, Alliance job title, FGV degree name.
- Rewrite LinkedIn "About" to match the site positioning.
- Optional: connect the repo to Vercel for auto-deploy; headshot, CV download, custom domain.

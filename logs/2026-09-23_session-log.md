# Session Log · 2026-09-23 · Portfolio Website

**Timestamp:** 2026-09-23 15:41 (Pittsburgh, UTC-04:00)
**Log ID:** `2026-09-23_session-log`
**Course:** 45-884 AI Methods for Social and Visual Data (Carnegie Mellon, Tepper)
**Tool:** Claude Code (VS Code extension, Windows)

## Outcome

| Deliverable | Link |
| --- | --- |
| Live site | https://luizmathias.vercel.app |
| Source code | https://github.com/luiz-mathias/portfolio |
| Local project | `AIPortfolioDemo/` (`index.html`, `README.md`, `.gitignore`, `deploy-vercel.ps1`) |

## Timeline

1. **First draft from two CVs.** Built a single-page site from the two PwC Strategy& CV versions (Strategy Consulting and Tech Strategy). LinkedIn could not be read directly because it blocks automated access.
2. **Enriched with a LinkedIn PDF export.** Added the early career at Pelissari (starting as an SAP ERP intern in 2009), agentic AI skills, ITIL and Kanban certifications, product work, and a new "Where I fit" section aimed at consulting, tech, and industry recruiters.
3. **Deployed to Vercel.** Published through Vercel's REST API from PowerShell, since the machine has no Node, Vercel CLI, or Git.
4. **Published to GitHub.** Created the public `portfolio` repo and uploaded the files through GitHub's REST API.

## Main takeaways

**Content and positioning**
- Lead with outcomes. The "Impact ledger" (€142M, €44.7M, €7.4B, 90%, €4M) gives recruiters the proof in seconds.
- One site can serve several audiences if it names them. "Where I fit" frames the same experience for consulting, tech/product, and corporate strategy roles.
- The SAP intern (2009) to SAP CRO office (2026) arc is a memorable story the CVs were not telling.
- Each source added something: CVs had the metrics, LinkedIn had the early career, skills, and certifications.

**Consistency risk**
- A public site invites recruiters to compare it with LinkedIn and the CV. Three mismatches remain open (see below).

**Technical**
- A static site does not need a framework: one `index.html` with no build step deploys anywhere.
- Missing tools are not a blocker. Both Vercel and GitHub accept uploads through their REST APIs, which PowerShell can call directly.
- The site adapts to light and dark mode and to phone screens, with no em dashes in the copy (personal style rule).

**Security**
- Access tokens stay in local files outside the project folder and are never pasted into chat or committed.
- `.gitignore` blocks token files as a second line of defense.
- Tokens were created with the narrowest scope and a short expiry, and should be revoked after use.

## Open items

- [ ] Reconcile LinkedIn vs CV: Cast Group dates (CV 2014-2017 vs LinkedIn 2018-2021), Alliance job title, FGV degree name.
- [ ] Rewrite the LinkedIn "About" section to match the site's positioning (AI, SAP, MBA).
- [ ] Revoke the GitHub and Vercel tokens.
- [ ] Optional: connect the GitHub repo to Vercel for automatic deploys.
- [ ] Optional: add a headshot, a "Download CV" link, and a custom domain.
- [ ] Decide on adding the NLP Master Practitioner certification (left out on purpose).

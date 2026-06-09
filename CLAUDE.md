# skv — Sanaz Kakavand's Academic Website

Hugo static site deployed to GitHub Pages at https://sanazkv.github.io/

## Stack

- **Generator:** Hugo (extended, latest)
- **Theme:** custom theme at `themes/academic/`
- **Styling:** Tailwind CSS via CDN (with typography plugin) — no build step needed
- **Font:** Tilda Sans loaded from Tilda's CDN via `@font-face`
- **Deployment:** GitHub Actions → `gh-pages` branch → GitHub Pages

## Project structure

```
skv/
├── _index.md          ← home page content
├── bio.md             ← bio page
├── research.md        ← research page
├── teaching.md        ← teaching page
├── cv.md              ← cv page  (add /static/cv.pdf for download link)
├── hugo.toml          ← site config (contentDir = "." so pages live at root)
├── static/            ← put cv.pdf and any images here
├── themes/academic/
│   ├── layouts/
│   │   ├── _default/baseof.html   ← base HTML with Tailwind CDN
│   │   ├── _default/single.html   ← page layout
│   │   └── index.html             ← home layout with social links
│   └── static/css/style.css       ← minimal overrides (mostly unused with Tailwind)
└── .github/workflows/hugo.yml     ← CI/CD to gh-pages branch
```

## Color palette

| Token | Hex | Usage |
|---|---|---|
| `ink` | `#1a1a18` | body text, headings |
| `muted` | `#5a5a52` | secondary text, nav |
| `gold` | `#e8c84a` | accents, underlines, hover borders |
| `gold-soft` | `#f5e9a8` | hover backgrounds |
| `border` | `#e2e0d4` | dividers, card borders |

## Common tasks

### Local preview
```bash
hugo server -D
```
Then open http://localhost:1313

### Add a new page
Create a `.md` file at the project root with YAML front matter:
```yaml
---
title: "Page Title"
description: "SEO description"
date: 2024-01-01
---
```
Then add it to the `[menu]` section in `hugo.toml`.

### Upload CV
Put `cv.pdf` into the `static/` directory. The link in `cv.md` already points to `/cv.pdf`.

### Update social links
Edit the `[params.social]` section in `hugo.toml`.

### Update author info (name, role, affiliation, email)
Edit the `[params]` section in `hugo.toml`.

## Deployment

Push to `main` → GitHub Actions builds with Hugo → deploys to `gh-pages` branch.

In your GitHub repo settings: **Pages → Source → Deploy from branch → `gh-pages` / `/ (root)`**

### First-time GitHub setup
```bash
git init
git remote add origin https://github.com/sanazkv/sanazkv.github.io.git
git add .
git commit -m "initial site"
git push -u origin main
```
> If the repo is `sanazkv/sanazkv.github.io`, the site will be at `https://sanazkv.github.io/` automatically.
> For a project repo like `sanazkv/skv`, set `baseURL = "https://sanazkv.github.io/skv/"` in `hugo.toml`.

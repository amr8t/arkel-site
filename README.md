# Arkel website

Plain [Zola](https://www.getzola.org/) static site, gh-pages-ready. This repo
is the site only — the arkel source lives in `../arkel` (or `amr8t/arkelstore`).

## Edit & build locally

```sh
zola serve   # live preview at http://127.0.0.1:1111
zola build   # outputs ./public (gitignored)
```

Pages are Markdown in `content/`. Templates in `templates/`, styling in
`static/style.css`. Nothing to configure — content is the site.

## Deploy

Pushing to `master` runs `.github/workflows/deploy.yml`, which builds and
publishes `./public` to the `gh-pages` branch (GitHub Pages →
"Deploy from a branch" → `gh-pages`). Live at:
https://amr8t.github.io/arkel-site/

## Auto-generated CLI reference

`content/cli.md` is generated from the arkel CLI's clap definitions and is not
hand-edited. Regenerate it from the arkel checkout:

```sh
cd ../arkel
./scripts/gen_cli_docs.sh   # writes ../arkel-site/content/cli.md
```

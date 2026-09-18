# Arkel website

[VitePress](https://vitepress.dev/) static docs site for Arkel, published to
GitHub Pages. This repo is the site only — the arkel source lives in
`../arkel` (or `amr8t/arkel`).

## Dev & build

```sh
npm install
npm run docs:dev      # live preview at http://localhost:5173/
npm run docs:build    # outputs docs/.vitepress/dist
npm run docs:preview  # preview the production build
```

Content lives in `docs/`. Sidebar/nav/search live in
`docs/.vitepress/config.mts`. Styling can be layered via a custom theme in
`docs/.vitepress/theme`.

## Deploy

Pushing to `master` runs `.github/workflows/deploy.yml`, which builds and
publishes `docs/.vitepress/dist` to the `gh-pages` branch (GitHub Pages →
"Deploy from a branch" → `gh-pages`). Live at:
https://arkeldata.com

## Auto-generated CLI reference

`docs/cli.md` is generated from the arkel CLI's clap definitions and is not
hand-edited. Regenerate it from the arkel checkout:

```sh
cd ../arkel
./scripts/gen_cli_docs.sh   # writes ../arkel-site/docs/cli.md
```

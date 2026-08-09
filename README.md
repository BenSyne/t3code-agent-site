# t3code-agent-site

The landing page for the [T3 Code Agent Build](https://github.com/BenSyne/t3code/releases/tag/v0.0.32-agent.1).

One file — `index.html` — with everything inlined except the Google Fonts stylesheet. No build
step, no framework, no dependencies.

## Deploying on Coolify

**New Resource → Application → Public/Private Repository**, point it at this repo, and pick
**Dockerfile** as the build pack. Coolify reads the `Dockerfile`, builds an nginx image and serves
port `80`. Set the domain, let it issue the certificate, done.

If you'd rather skip Docker, the **Static** build pack also works — set the publish directory to
`/` and Coolify will serve `index.html` directly.

## Running it locally

```bash
docker build -t t3code-agent-site .
docker run --rm -p 8080:80 t3code-agent-site
```

Then open http://localhost:8080.

Or just open `index.html` in a browser — it works from `file://` too.

## Editing

Everything lives in `index.html`: the palette is a block of CSS custom properties at the top, the
orchestration diagram is hand-written inline SVG, and the two links that matter are the release
download and PR #1. Redeploy is a push.

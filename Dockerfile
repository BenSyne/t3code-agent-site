# Static landing page. Nothing to build — nginx serves the file as-is.
FROM nginx:1.27-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html
# The demo video and any other small static files. The DMG does NOT go here —
# GitHub blocks repo files over 100 MB, so it lives in a GitHub release or in
# a volume mounted at /usr/share/nginx/html/downloads.
COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s \
  CMD wget -qO- http://127.0.0.1/ >/dev/null || exit 1

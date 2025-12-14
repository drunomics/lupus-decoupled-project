# Lupus Decoupled Project

[![Open in GitHub Codespaces](https://img.shields.io/badge/Codespaces-Open-blue?logo=github)](https://codespaces.new/drunomics/lupus-decoupled-project?quickstart=1)

A [ddev](https://ddev.com/) + [devcontainers](https://containers.dev/) enabled decoupled Drupal project template.

**Stack:**
- Backend: Drupal 11 + [Lupus Decoupled](https://lupus-decoupled.org)
- Frontend: Nuxt (runs via pm2 in the ddev web container)
- Development: ddev + Docker

## Quick Start

### GitHub Codespaces (Recommended)

Click the badge above to launch a full development environment in your browser. See [USAGE.md](USAGE.md) for common commands.

### Local Setup with ddev

Requirements: [ddev v1.23+](https://ddev.readthedocs.io/en/latest/users/install/ddev-installation/)

```bash
ddev start
ddev site-install

# Login and get started
ddev launch /user/login
```

**Default URLs:**
- Frontend: https://lupus-nuxt.ddev.site
- Backend: https://lupus-decoupled.ddev.site

## Configuration

### Change frontend repository

```bash
ddev config --web-environment-add="FRONTEND_REPOSITORY=https://github.com/drunomics/lupus-decoupled-nuxt-starter"
```

### Auto-enable optional modules

Optional modules (responsive preview, webforms) are auto-enabled when `LUPUS_DECOUPLED_AUTO_ENABLE=1` (default).

## Documentation

- **Commands**: See [USAGE.md](USAGE.md)
- **Lupus Decoupled**: https://lupus-decoupled.org
- **ddev**: https://ddev.readthedocs.io

## Codespaces/Devcontainer Options

Multiple configurations available when launching via Codespaces or local devcontainer:
- **Default**: Nuxt Naked - Minimal setup
- **nuxt-shadcn**: Nuxt with shadcn/ui components
- **nextjs**: Next.js frontend
- **recipe-blog**: Drupal CMS Blog + Lupus Decoupled (WIP)
- **recipe-demo**: Drupal CMS Starter + Lupus Decoupled (WIP)

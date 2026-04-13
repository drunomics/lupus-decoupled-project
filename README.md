# Lupus Decoupled Project

[![Open in GitHub Codespaces](https://img.shields.io/badge/Codespaces-Open-blue?logo=github)](https://codespaces.new/drunomics/lupus-decoupled-project?quickstart=1)

A project template for [Lupus Decoupled](https://lupus-decoupled.org) that makes it easy to run backend and frontend together using [ddev](https://ddev.com/) + [devcontainers](https://containers.dev/).

**Stack:**
- Backend: Drupal 11 + [Lupus Decoupled](https://lupus-decoupled.org)
- Frontend: Configurable ([Nuxt](https://github.com/drunomics/lupus-decoupled-nuxt-starter)/Next/... - runs via pm2 in the ddev web container)
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
- **cms-nuxt-starter**: Drupal CMS + Lupus Decoupled Starter recipe
- **custom**: Custom (Advanced) - Configure all options via secrets

## Testing with Drupal CMS

To set up a local environment with [Drupal CMS](https://www.drupal.org/project/cms) and the [Lupus Decoupled Starter](https://www.drupal.org/project/lupus_decoupled_starter) recipe:

```bash
ddev start
ddev composer require drupal/cms:^2 drupal/lupus_decoupled_starter:^2.0.0
RECIPE=../recipes/lupus_decoupled_starter ddev site-install
```

Or use the **cms-nuxt-starter** devcontainer option which does this automatically.

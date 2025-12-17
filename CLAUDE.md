# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Lupus Decoupled Drupal** project - a modern decoupled CMS with Drupal 11+ backend and Nuxt frontend. Find docs at http://lupus-decoupled.org It makes use of a custom elements api /ce-api/<route> which provides the page content rendered as a tree of custom elements. The frontend renders those elements by mapping them to Vue components.

## Development Commands

### Backend (Drupal)
```bash
# Check DDEV status
ddev status

# Start/manage DDEV environment
ddev start
ddev composer install
ddev drush site-install -y ../recipes/lupus_decoupled_recipe/standard
# Note: Admin password is set to 'lupus123' by the install script
ddev launch /user/login

# Common drush commands via DDEV
ddev drush cache:rebuild
ddev drush upwd admin newpassword
ddev drush status
```

### Frontend (Nuxt with nuxtjs-drupal-ce module)
```bash
npm run dev          # Development server
npm run build        # Production build
npm run lint         # ESLint check
npm run lint-fix     # Fix ESLint issues
```

### Testing & Quality
```bash
# Run all recipe tests
ddev exec ./vendor/bin/phpunit --testsuite=recipes

# Run specific test
ddev exec ./vendor/bin/phpunit recipes/lupus_decoupled_recipe/tests/src/Functional/GenericStandardTest.php

# PHP coding standards
ddev exec ./vendor/bin/phpcs
```

## Architecture

### Backend Structure
- **web/**: Drupal root with core, modules, themes
- **web/modules/contrib/**: Drupal contrib modules, including lupus_decoupled.
- **web/modules/custom/lupus_decoupled_drupal_example/**: Example components
- **recipes/lupus_decoupled_recipe/**: Automated Drupal setup


### Frontend Structure
- **frontend/components/global/**: Components for "custom-elements", mapping to the output of Drupal. Using kebap-case for file names.
- **frontend/components/**: Other components. Using CamelCase for filenames.
- **frontend/pages/**: Nuxt pages and routing

### Key Integration Points
- Uses `nuxtjs-drupal-ce` module for Drupal Custom Elements integration
- REST API endpoint /ce-api/<route> for content delivery in JSON
- Component-based architecture with Vue.js components for Drupal entities
- Custom elements module has configurable output by view mode. The resulting configuration is managed in config entities, prefixed with "custom_elements.enttiy_ce_display.". For example for the "full" view-mode of articles, the config item is "custom_elements.entity_ce_display.node.article.full"

## Development Environment

- **Frontend URL**: https://lupus-nuxt.ddev.site
- **Backend URL**: https://lupus-decoupled.ddev.site
- **Container-first**: DDEV required for consistent development
- **Cloud ready**: GitHub Codespaces and Gitpod support

## Configuration Files

- `composer.json`: PHP dependencies and Drupal config
- `frontend/nuxt.config.ts`: Nuxt.js configuration
- `recipes/lupus_decoupled_recipe/recipe.yml`: Recipe for simple setup
- `phpunit.xml.dist` & `phpcs.xml.dist`: Testing and code quality

## Development Guidelines

- Always use proper dependency injection and obey Drupal coding standards
- Check changes with phpcs when finished

## Development Best Practices

- Always check Drupal coding style and tests to work after doing changes.
- Always run kernel tests after changing something.
- Functional tests only run if there is some relation to the change that might have broke them.

## Development

1. Follow Drupal coding standards
2. Add tests for new functionality
3. Use translatable strings for all user-facing text
4. Document features in the module README
5. Ensure all tests pass before submitting

## Claude AI Guidelines

- Always provide an implementation plan and ask for confirmation before implementing.

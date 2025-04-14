[![Codespaces ready-to-code](https://img.shields.io/badge/Codespaces-ready--to--code-blue?logo=github)](https://github.com/codespaces/new/drunomics/lupus-decoupled-project?quickstart=1&devcontainer_path=.devcontainer%2Fbase_with_nuxt_naked%2Fdevcontainer.json)

[![Codespaces ready-to-code](https://img.shields.io/badge/Codespaces-demo-098383?logo=github)](https://codespaces.new/drunomics/lupus-decoupled-project?quickstart=1&devcontainer_path=.devcontainer%2Fdemo_with_nuxt_shadcn%2Fdevcontainer.json)


# lupus decoupled project

A [ddev](https://ddev.com/) + [devcontainers](https://containers.dev/) enabled decoupled project template

## Local setup with ddev

[ddev](https://ddev.com/) is a ridiculously simple setup for complex development environments, based upon docker compose.

Requirements:
* ddev v1.23 or later. Please follow the [installation instructions](https://ddev.readthedocs.io/en/latest/users/install/ddev-installation/)

Resources:
* [.ddev/config.yaml](https://github.com/drunomics/lupus-decoupled-project/blob/main/.ddev/config.yaml) - main ddev (default) configuration, can be generated by running `ddev config`
* [ddev docs](https://ddev.readthedocs.io)

Optionally, customize the project:

      # Configure a different frontend repository.
      ddev config --web-environment-add="FRONTEND_REPOSITORY=https://github.com/drunomics/lupus-decoupled-nuxt3-demo"


To spin up the project locally run:

      ddev start
      ddev composer install
      ddev drush site-install -y --account-pass=admin --site-name='lupus_decoupled' standard
      ddev drush recipe ../recipes/lupus_decoupled_recipe

      # Login and get started
      ddev drush upwd admin somepass
      ddev launch /user/login

When using ddev locally the URLs are by default:

  * Frontend: https://lupus-nuxt.ddev.site
  * Backend: https://lupus-decoupled.ddev.site

## Configuration

### Change the default frontend repository

For example, to change the repository from nuxt3 to nuxt2 run the following command:

      ddev config --web-environment-add="FRONTEND_REPOSITORY=${FRONTEND_REPOSITORY:-https://github.com/drunomics/lupus-decoupled-nuxt-demo}"

### Auto-enable optional modules

Optional modules, like responsive preview or webforms, are auto-enabled when the environment variable
LUPUS_DECOUPLED_AUTO_ENABLE is set to 1. This is done by default and can be disabled via the ddev config.

### Automatic frontend login via a shared-cookie domain

In order to setup a shared cookie domain, adjust the cookie_domain option of
Drupal via the `services.yml` configuration file, or set the option via
an environment variable via pre-installed services_env_parameter module. For
that, simply set suiting values for ddev/gitpod at the locations as output
by:

     git grep -B 1 DRUPAL_SERVICE_session__storage__options___cookie_domain

The commented values work by default for the Gitpod/ddev setup, but consider
the following **SECURITY WARNING**:

The values suggested are configured to share the session cookie on the shared domain `.gitpod.io** by default. This
allows all *.gitpod.io instances to read your session cookie. When using Gitpod for anything else than testing
purposes, use a custom parent domain.

## Development in Cloud

### GitHub Codespaces

Use [GitHub Codespaces](https://docs.github.com/en/codespaces/about-codespaces/what-are-codespaces) to setup a full Drupal dev environment in a browser.

This project demonstrates a complete Drupal 10 development environment,
utilizing ddev and Codespaces, through your browser. Refer to
https://docs.github.com/en/codespaces for usage documentation.

Documentation is found in the [Play online](https://lupus-decoupled.org/get-started/play-online) section of the Lupus Decoupled Drupal documentation.

### Gitpod testing options

[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/drunomics/lupus-decoupled-project)

[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-demo-098383?logo=gitpod)](https://gitpod.io/new/#LD_PROJECT_TYPE=demo/https://github.com/drunomics/lupus-decoupled-project)


**NOTE:** *Gitpod setup is deprecated. Only 50 development hours are provided in the free tier of Gitpod Flex package. Above that a [paid subscription](https://www.gitpod.io/pricing) is needed.*

When working on this template, things can be tested best on gitpod by modifying the launch link.

**Testing project-template branches**
Use the following link and replace `<<BRANCH>>` with the actual branch, if it contains slashes, keep
them:

```
https://gitpod.io/new/#DP_PROJECT_NAME=lupus_decoupled,DP_ISSUE_BRANCH=1.x,DP_PROJECT_TYPE=project_module,DP_MODULE_VERSION=1.x,DP_PATCH_FILE=,FRONTEND_REPOSITORY=https%3A%2F%2Fgithub.com%2Fdrunomics%2Flupus-decoupled-nuxt3-demo,CUSTOM_ELEMENTS_VERSION=3.*,DP_INSTALL_PROFILE=standard/https://github.com/drunomics/lupus-decoupled-project/tree/<<BRANCH>>
```

**Testing frontend repository branches**
Use the following link and replace `<<BRANCH>>` with the actual branch of the frontend repository that should be used. If it contains slashes, url-encode them by replacing them with `%2F`:

```
https://gitpod.io/new/#DP_PROJECT_NAME=lupus_decoupled,DP_ISSUE_BRANCH=1.x,DP_PROJECT_TYPE=project_module,DP_MODULE_VERSION=1.x,DP_PATCH_FILE=,FRONTEND_REPOSITORY=https%3A%2F%2Fgithub.com%2Fdrunomics%2Flupus-decoupled-nuxt3-demo,FRONTEND_BRANCH=<<BRANCH>>,CUSTOM_ELEMENTS_VERSION=3.*,DP_INSTALL_PROFILE=standard/https://github.com/drunomics/lupus-decoupled-project/tree/main
```

#### Gitpod Project Types

There are multiple project types controlled via the environment variable `LD_PROJECT_TYPE`:

* [![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-base-blue?logo=gitpod)](https://gitpod.io/new/#LD_PROJECT_TYPE=base/https://github.com/drunomics/lupus-decoupled-project) Base setup using Drupal core with Lupus Decoupled Drupal and a blank frontend. Perfect to start developing 👩🏽‍💻
* [![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-demo-098383?logo=gitpod)](https://gitpod.io/new/#LD_PROJECT_TYPE=demo/https://github.com/drunomics/lupus-decoupled-project): Extends the Drupal CMS Starter recipe with Lupus Decoupled Drupal and the _shadcn_ demo frontend. Perfect for testing and playing around 🎮
* [![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-blog-red?logo=gitpod)](https://gitpod.io/new/#LD_PROJECT_TYPE=blog/https://github.com/drunomics/lupus-decoupled-project): Extends the Drupal CMS Blog recipe with Lupus Decoupled Drupal and the _shadcn_ demo frontend. Perfect if you want to create your own blog 📝

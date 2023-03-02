[![Gitpod ready-to-code](https://img.shields.io/badge/Gitpod-ready--to--code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/drunomics/lupus-decoupled-project)

# lupus decoupled project

A ddev + Gitpod enabled decoupled project template

## Set up on Gitpod.

Use gitpod.io to setup a full Drupal dev environment in a browser.

This project demonstrates a complete Drupal 10 development environment, utilizing ddev and Gitpod, through your browser.
Refer to https://gitpod.io/#https://github.com/shaal/ddev-gitpod for usage documentation.


**!! SECURITY WARNING !!**

Gitpod Drupal instances are configured to share the session cookie on the shared domain `.gitpod.io` by default. This allows all *.gitpod.io instances to read your session cookie.

When using Gitpod for anything else than testing purposes, change the setting 
`DRUPAL_SERVICE_session__storage__options___cookie_domain` in `.gitpod.yml`.


## Local setup with ddev

ddev is a ridiculously simple setup for complex development environments, based upon docker compose.

Requirements:
* ddev v1.21.4 or later. Please follow the [installation instructions](https://ddev.readthedocs.io/en/latest/users/install/ddev-installation/)

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
      ddev drush pm-enable lupus_decoupled, services_env_parameter -y
      # Configure lupus-decoupled frontend base URL
      ddev drush config:set lupus_decoupled_ce_api.settings frontend_base_url https://lupus-nuxt.ddev.site -y
      # Login and get started adding some test-nodes
      ddev drush user-login

When using ddev locally the URLs are by default:

  * Frontend: https://lupus-nuxt.ddev.site
  * Backend: https://lupus-decoupled.ddev.site

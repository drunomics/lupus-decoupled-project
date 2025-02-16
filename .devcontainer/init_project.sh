#!/bin/bash
set -ex

# Wait for docker to be ready.
wait_for_docker() {
  while true; do
    docker ps > /dev/null 2>&1 && break
    sleep 1
  done
  echo "Docker is ready."
}

wait_for_docker

[[ -n $LD_PROJECT_TYPE ]] || LD_PROJECT_TYPE="base"
source ./env/${LD_PROJECT_TYPE}.env || echo ""
ddev config --web-environment-add="FRONTEND_REPOSITORY=${FRONTEND_REPOSITORY:-https://github.com/drunomics/lupus-decoupled-nuxt3-demo}"
ddev config --web-environment-add="FRONTEND_BRANCH=${FRONTEND_BRANCH:-main}"
# Set environment variables for both Nuxt and Next frontends.
ddev config --web-environment-add="NUXT_PUBLIC_DRUPAL_CE_DRUPAL_BASE_URL=https://${CODESPACE_NAME}-3000.app.github.dev"
ddev config --web-environment-add="NEXT_PUBLIC_DRUPAL_BASE_URL=https://${CODESPACE_NAME}-8080.app.github.dev"
# For an automated frontend login, set a shared parent domain:
# ddev config --web-environment-add="DRUPAL_SERVICE_session__storage__options___cookie_domain=.gitpod.io"
ddev start -y
[[ -z $CUSTOM_ELEMENTS_VERSION ]] || ddev composer require drupal/custom_elements:$CUSTOM_ELEMENTS_VERSION --no-update
ddev composer install
[[ -z $ADDITIONAL_COMPOSER_PACKAGES ]] || ddev composer require $ADDITIONAL_COMPOSER_PACKAGES
ddev drush si -y --site-name='lupus decoupled' standard
if [[ -n $ADDITIONAL_RECIPES ]]; then
  for recipe in $(echo "$ADDITIONAL_RECIPES" | tr ',' '\n'); do
    ddev drush recipe $recipe
  done
fi
ddev drush recipe ../recipes/lupus_decoupled_recipe -y
ddev drush en services_env_parameter -y
# Configure lupus-decoupled frontend base URL
ddev drush config:set lupus_decoupled_ce_api.settings frontend_base_url https://${CODESPACE_NAME}-3000.app.github.dev -y
echo "[NOTE] Setting default admin password for easy testing: lupus123"
ddev drush user:password admin lupus123

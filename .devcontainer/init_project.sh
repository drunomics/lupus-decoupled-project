#!/bin/bash
set -ex

echo "=============================================="
echo "  Lupus Decoupled - Codespace Setup"
echo "=============================================="

# Wait for docker to be ready.
wait_for_docker() {
  echo "[1/8] Waiting for Docker to be ready..."
  while true; do
    docker ps > /dev/null 2>&1 && break
    sleep 1
  done
  echo "Docker is ready."
}

wait_for_docker

echo "[2/8] Configuring project environment..."
[[ -n $LD_PROJECT_TYPE ]] || LD_PROJECT_TYPE="base"
source ./env/${LD_PROJECT_TYPE}.env || echo ""
ddev config --web-environment-add="FRONTEND_REPOSITORY=${FRONTEND_REPOSITORY:-https://github.com/drunomics/lupus-decoupled-nuxt-starter}"
ddev config --web-environment-add="FRONTEND_BRANCH=${FRONTEND_BRANCH:-main}"
# Set environment variables for both Nuxt and Next frontends.
ddev config --web-environment-add="NUXT_PUBLIC_DRUPAL_CE_DRUPAL_BASE_URL=https://${CODESPACE_NAME}-80.app.github.dev"
ddev config --web-environment-add="NUXT_PUBLIC_DRUPAL_CE_SERVER_DRUPAL_BASE_URL=https://${CODESPACE_NAME}-80.app.github.dev"
ddev config --web-environment-add="NEXT_PUBLIC_DRUPAL_BASE_URL=https://${CODESPACE_NAME}-80.app.github.dev"
# For an automated frontend login, set a shared parent domain:
# ddev config --web-environment-add="DRUPAL_SERVICE_session__storage__options___cookie_domain=.gitpod.io"

echo "[3/8] Starting DDEV containers..."
ddev start -y

echo "[4/8] Installing PHP dependencies..."
[[ -z $CUSTOM_ELEMENTS_VERSION ]] || ddev composer require drupal/custom_elements:$CUSTOM_ELEMENTS_VERSION --no-update
ddev composer install
[[ -z $ADDITIONAL_COMPOSER_PACKAGES ]] || ddev composer require $ADDITIONAL_COMPOSER_PACKAGES

echo "[5/8] Installing Drupal..."
ddev drush si -y --site-name='lupus decoupled' standard

echo "[6/8] Applying Drupal recipes..."
RECIPES=${RECIPES:-../recipes/lupus_decoupled_recipe}
for recipe in $(echo "$RECIPES" | tr ',' '\n'); do
  echo "       Applying recipe: $recipe"
  ddev drush recipe $recipe -y
done
ddev drush en services_env_parameter -y

echo "[7/8] Configuring frontend integration..."
# Configure lupus-decoupled frontend base URL
ddev drush config:set lupus_decoupled_ce_api.settings frontend_base_url https://${CODESPACE_NAME}-3000.app.github.dev -y
echo "       Setting default admin password: lupus123"
ddev drush user:password admin lupus123

echo "[8/8] Exposing ports as public..."
gh codespace ports visibility 80:public --codespace "${CODESPACE_NAME}"
gh codespace ports visibility 3000:public --codespace "${CODESPACE_NAME}"

echo ""
echo "=============================================="
echo "  Setup Complete!"
echo "=============================================="
echo "  Backend:  https://${CODESPACE_NAME}-80.app.github.dev/user/login"
echo "  Frontend: https://${CODESPACE_NAME}-3000.app.github.dev"
echo "  Login:    admin / lupus123"
echo "=============================================="

<?php

// #ddev-generated: Automatically generated Drupal settings file.
if (file_exists($app_root . '/' . $site_path . '/settings.ddev.php') && getenv('IS_DDEV_PROJECT') == 'true') {
  include $app_root . '/' . $site_path . '/settings.ddev.php';
}

use Symfony\Component\HttpFoundation\Request;

// @todo: This is a temporary workaround to fix the Drupal base URL in
// github codespaces setup. Without reverse proxy the "View API" operation
// link redirecting to http://localhost:80 instead of the backend URL of 
// the current GitHub Codespace.
// For non-Github codespaces environments this hunk can be removed.
$settings['reverse_proxy'] = TRUE;
$settings['reverse_proxy_addresses'] = [$_SERVER['REMOTE_ADDR']];
$settings['reverse_proxy_header'] = Request::HEADER_X_FORWARDED_HOST | Request::HEADER_X_FORWARDED_PROTO;

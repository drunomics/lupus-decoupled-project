<?php

// #ddev-generated: Automatically generated Drupal settings file.
if (file_exists($app_root . '/' . $site_path . '/settings.ddev.php') && getenv('IS_DDEV_PROJECT') == 'true') {
  include $app_root . '/' . $site_path . '/settings.ddev.php';
}

use Symfony\Component\HttpFoundation\Request;

$settings['reverse_proxy'] = TRUE;
$settings['reverse_proxy_addresses'] = [$_SERVER['REMOTE_ADDR']];
$settings['reverse_proxy_header'] = Request::HEADER_X_FORWARDED_HOST | Request::HEADER_X_FORWARDED_PROTO;

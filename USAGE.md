# Lupus Decoupled Project - Usage Guide

Get started by following the first-steps guide:
https://lupus-decoupled.org/guide/first-steps

## Common Commands

### Generate one-time login link
ddev drush uli

### Set admin password
ddev drush upwd admin newpassword

### Access the web container
ddev ssh

### View frontend logs (use Ctrl+C to exit)
ddev exec pm2 logs

### Restart frontend server
ddev exec pm2 restart nuxt

### Restart everything
ddev restart

### Fresh install (wipes database)
ddev site-install

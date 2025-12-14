# Lupus Decoupled Project - Usage Guide

Get started by following the first-steps guide:
https://lupus-decoupled.org/guide/first-steps

## Common Commands

### Generate one-time login link
ddev drush uli

### Access the web container
ddev ssh

### View frontend logs (use Ctrl+C to exit)
ddev pm2 logs

### Restart frontend server
ddev pm2 restart nuxt

### Restart everything
ddev restart

## Troubleshooting

### Ports not public?
Manually set 3000 and 8080 to "Public" in Ports tab

### Backend 404?
ddev restart

### Frontend issues?
ddev pm2 logs

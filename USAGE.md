# Lupus Decoupled Project - Usage Guide

Get started, by following the first-steps guide:
https://lupus-decoupled.org/guide/first-steps

## Useful Commands

```
# Generate one-time login link:
ddev drush uli

# Access the web container:
ddev ssh

# View frontend logs (streaming, Ctrl+C to exit):
ddev exec -d frontend pm2 logs

# Restart frontend server:
ddev exec -d frontend pm2 restart all

# Restart everything:
ddev restart
```

## Troubleshooting

* Ports not public? 
  -> Manually set 3000 and 8080 to "Public" in Ports tab

* Backend 404? 
  -> Run `ddev restart` and wait ~30 seconds
  
* Frontend issues? 
  -> Check logs with `ddev exec -d frontend pm2 logs`

Here's a summary of the Nginx directory structure and setup we discussed:

Key Directories:
```bash
/etc/nginx/
├── sites-available/   # Store your site configurations here
├── sites-enabled/     # Symbolic links to enabled sites from sites-available
├── conf.d/           # Additional configuration files
└── nginx.conf        # Main nginx configuration file

/var/www/
├── hello_world/      # Your application files (like index.html)
└── html/            # Default nginx website location
```

Important Configuration Files:
1. Site Configuration (`/etc/nginx/sites-available/hello_world`):
```nginx
server {
    listen 80;
    server_name localhost;
    root /var/www/hello_world;
    index index.html;
    location / {
        try_files $uri $uri/ =404;
    }
}
```

Key Commands:
```bash
# Enable a site
sudo ln -s /etc/nginx/sites-available/your_site /etc/nginx/sites-enabled/

# Test configuration
sudo nginx -t

# Reload configuration
sudo systemctl reload nginx

# Restart nginx completely
sudo systemctl restart nginx

# Check status
sudo systemctl status nginx
```

File Permissions:
- Nginx runs as user `www-data`
- Standard permissions for web files:
```bash
sudo chown -R www-data:www-data /var/www/your_site
sudo chmod -R 755 /var/www/your_site
```

Default Site:
- Located at `/var/www/html/index.nginx-debian.html`
- We backed it up rather than deleting: `.html.backup`
- Will show if no other sites are configured properly

Remember:
- Always test configuration before reloading
- Keep backups of configuration files
- Use sites-available/sites-enabled pattern for managing multiple sites
- Check logs at `/var/log/nginx/` for troubleshooting
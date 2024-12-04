HTML page:

```bash
daletran in everest in 127.0.0.1 ~
❯ cat /var/www/hello_world/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Nginx Test</title>
</head>
<body>
    <h1>Nginx is working!</h1>
    <p>If you can see this, your Nginx server is successfully running.</p>
</body>
</html>
```

Config:

```bash
daletran in everest in 127.0.0.1 ~
❯ cat /etc/nginx/sites-available/hello_world
server {
    listen 80;
    server_name localhost;  # Or your IP address

    root /var/www/hello_world;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
```

Enabled site:

```bash
daletran in everest in 127.0.0.1 ~
❯ ll /etc/nginx/sites-enabled/
total 0
drwxr-xr-x 2 root root  25 Dec  3 13:00 ./
drwxr-xr-x 8 root root 310 Dec  3 12:48 ../
lrwxrwxrwx 1 root root  38 Dec  3 13:00 hello_world -> /etc/nginx/sites-available/hello_world
```
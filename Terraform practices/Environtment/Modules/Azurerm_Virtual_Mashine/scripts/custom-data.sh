#!/bin/bash
set -e

apt-get update -y
apt-get install -y nginx

systemctl enable nginx
systemctl start nginx

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Terraform</title>
</head>
<body>
    <h1>Hello from Azure VM</h1>
    <p>Nginx installed using Terraform Custom Data.</p>
</body>
</html>
EOF

echo "Custom data executed successfully" > /var/log/custom-data.log
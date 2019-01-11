#!/bin/bash

cat > index.html <<EOF
<h1>ZatoIchi still the best!</h1>
<img src="https://reelgingermoviefan.files.wordpress.com/2013/11/zatoichi-2003-takeshi-kitano-original.jpg", width="800">
EOF

nohup busybox httpd -f -p "${server_port}" &

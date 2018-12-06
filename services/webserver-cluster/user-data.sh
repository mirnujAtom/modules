#!/bin/bash

cat > index.html <<EOF
<h1>ZatoIchi is the best samurai movie</h1>
<img src="https://thedullwoodexperiment.files.wordpress.com/2015/12/zotr-scene3.jpg">
EOF

nohup busybox httpd -f -p "${server_port}" &

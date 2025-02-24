if [[ -z "$1" ]]; then
	echo "Error: No module name provided."
	exit 1
fi

cat <<EOF >index.php
<?php

echo "hello world";
echo "\n";
echo "${1}";
EOF

cat <<EOF >run.sh
#!/bin/bash

php index.php
EOF

chmod +x run.sh

cat <<EOF >makefile
run:
	./run.sh
EOF

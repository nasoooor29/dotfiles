if [[ -z "$1" ]]; then
    echo "Error: No module name provided."
    exit 1
fi

go mod init "$1"
cat <<EOF >main.go
package main

import "fmt"

func main() {
    fmt.Println("Hello, World!")
    fmt.Println("${1}")
}
EOF

cat <<EOF >run.sh
#!/bin/bash

if ! go run .; then
    echo "Running 'go mod tidy'..."
    go mod tidy
    go run .
fi
EOF

chmod +x run.sh

cat <<EOF >Makefile
run:
	./run.sh
EOF

if ! command -v uv &>/dev/null; then
	echo "bun command not found. Installing..."
	curl -fsSL https://bun.sh/install | bash
fi

if [[ -z "$1" ]]; then
	echo "Error: No module name provided."
	exit 1
fi

bun init -y

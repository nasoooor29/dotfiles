if [[ -z "$1" ]]; then
    echo "Error: No module name provided."
    exit 1
fi

cat <<'EOF' >main.py
def main():
    print("Hello, World!")
    print("$1")

if __name__ == "__main__":
    main()
EOF

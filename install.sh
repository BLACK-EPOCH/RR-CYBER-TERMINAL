#!/data/data/com.termux/files/usr/bin/bash
set -eu

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
PREFIX="${PREFIX:-/data/data/com.termux/files/usr}"

if [ ! -d "$PREFIX/bin" ]; then
    echo "Error: Termux environment not found."
    exit 1
fi

if [ ! -f "$REPO_DIR/rrcyber.sh" ]; then
    echo "Error: rrcyber.sh not found."
    exit 1
fi

mkdir -p "$PREFIX/bin"
install -m 755 "$REPO_DIR/rrcyber.sh" "$PREFIX/bin/rrcyber"

echo "RR CYBER TERMINAL installed!"
echo "Run this command: rrcyber"
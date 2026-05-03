#!/bin/bash
# Usage:
#   ./add.sh             -> prompts for name and message
#   ./add.sh hong        -> name from arg, prompts for message

# Move to script directory so relative paths work
cd "$(dirname "$0")"

NAME=$1
if [ -z "$NAME" ]; then
  read -p "Enter your name: " NAME
fi

if [ -z "$NAME" ]; then
  echo "[Error] Name cannot be empty."
  exit 1
fi

read -p "Enter your message: " MESSAGE

if [ -z "$MESSAGE" ]; then
  echo "[Error] Message cannot be empty."
  exit 1
fi

FILE="entries/${NAME}.md"

if [ -f "$FILE" ]; then
  echo "[Warning] Already exists: $FILE"
  exit 1
fi

DATETIME=$(date +"%Y-%m-%d %H:%M")

# 1) Create entry file
cat > "$FILE" <<EOF
# $NAME

- **GitHub**: @$NAME
- **Datetime**: $DATETIME
- **Message**: $MESSAGE
EOF

# 2) Append to guestbook.md
echo "- $DATETIME | $NAME | $MESSAGE" >> guestbook.md

echo ""
echo "[OK] Created  $FILE"
echo "[OK] Appended guestbook.md"
echo ""
echo "Next steps:"
echo "  1. git add $FILE guestbook.md"
echo "  2. git commit -m \"add: $NAME\""
echo "  3. git push origin your-branch"

#!/data/data/com.termux/files/usr/bin/bash

NAME_FILE="$HOME/.rr_cyber_name"
CHANNEL="https://t.me/RR_CBR_TEAM1"

G='\033[1;32m'
C='\033[1;36m'
Y='\033[1;33m'
W='\033[1;37m'
R='\033[0m'

clear
echo -e "${G}"
echo ' ____  ____   ____ ____  _____ ____  '
echo '|  _ \|  _ \ / ___|  _ \| ____|  _ \ '
echo '| |_) | |_) | |   | |_) |  _| | |_) |'
echo '|  _ <|  _ <| |___|  _ <| |___|  _ < '
echo '|_| \_\_| \_\\____|_| \_\_____|_| \_\'
echo -e "${R}"
echo -e "${C}       >>> RR CYBER TERMINAL <<<${R}"
echo -e "${G}========================================${R}"

if [ ! -s "$NAME_FILE" ]; then
    echo
    read -r -p "Enter Your Name: " username
    username="${username//[^a-zA-Z0-9_. -]/}"
    username="${username:0:30}"
    [ -n "${username// }" ] || username="CyberUser"
    printf '%s\n' "$username" > "$NAME_FILE"
else
    username="$(cat "$NAME_FILE")"
fi

clear
echo -e "${G}"
echo '========================================'
echo '           RR CYBER TERMINAL'
echo '========================================'
echo -e "${R}"
echo -e "${C} Welcome, ${W}${username}${C}!${R}"
echo -e "${G} Welcome to RR CYBER TERMINAL${R}"
echo
echo -e "${Y} User   : ${W}${username}${R}"
echo -e "${Y} System : ${W}Termux Android${R}"
echo -e "${Y} Status : ${G}ONLINE${R}"
echo -e "${G}----------------------------------------${R}"
echo -e "${C} Telegram: ${W}${CHANNEL}${R}"
echo -e "${G}----------------------------------------${R}"
echo
echo -e "${Y}Commands: rrname | channel | exit${R}"
echo

if command -v termux-open-url >/dev/null 2>&1; then
    termux-open-url "$CHANNEL" >/dev/null 2>&1 &
fi

while true; do
    echo -ne "${G}${username}@RR-CYBER${C}:~$ ${R}"
    if ! IFS= read -r cmd; then
        echo
        break
    fi

    case "$cmd" in
        exit)
            echo -e "${Y}Goodbye, ${username}!${R}"
            break
            ;;
        rrname)
            read -r -p "New Name: " newname
            newname="${newname//[^a-zA-Z0-9_. -]/}"
            newname="${newname:0:30}"
            if [ -n "${newname// }" ]; then
                printf '%s\n' "$newname" > "$NAME_FILE"
                username="$newname"
                echo -e "${G}Name Updated!${R}"
            fi
            ;;
        channel)
            termux-open-url "$CHANNEL" 2>/dev/null || echo "$CHANNEL"
            ;;
        "")
            ;;
        *)
            bash -c "$cmd"
            ;;
    esac
done
EOF

chmod +x "$PREFIX/bin/rrcyber"

# Create a quick launcher command
echo 'rrcyber' > "$HOME/.rrcyber-start"

# Launch now
"$PREFIX/bin/rrcyber"
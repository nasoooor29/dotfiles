action_failed() {
    echo "Action failed" | wofii -d --prompt "Error"
}

action_success() {
    echo "Action succeeded" | wofii -d --prompt "Success" --lines 1
}

msg() {
    if [[ $? -eq 0 ]]; then
        action_success
    else
        action_failed
    fi
}

action=$(echo -e "Disconnect\nScan Networks\nConnect Manual" | wofii -d --prompt "Choose an action")

case "$action" in
"Disconnect")
    iwctl station wlan0 disconnect
    msg
    ;;
"Scan Networks")
    iwctl station wlan0 scan
    network=$(iwctl station wlan0 get-networks | awk 'NR>4 && $1 ~ /^[\x20-\x7E]+$/ {print $1}' | wofii -d)
    if [[ -n "$network" ]]; then
        if iwctl known-networks list | grep -Fxq "$network"; then
            iwctl station wlan0 connect "$network"
            msg
        else
            echo "Enter password for $network (leave empty if open network):"
            WIFIPASS=$(echo "if connection is stored, hit enter" | wofii -P -d --prompt "password" --lines 1)
            if [[ -n "$WIFIPASS" ]]; then
                iwctl station wlan0 connect "$network" --passphrase "$WIFIPASS"
                msg
            else
                iwctl station wlan0 connect "$network"
                msg
            fi
        fi
    fi
    ;;

"Connect Manual")
    echo "Enter SSID:"
    SSID=$(wofii -d --prompt "SSID" --lines 1)
    echo "Enter password for $SSID (leave empty if open network):"
    WIFIPASS=$(wofii -P -d --prompt "password" --lines 1)
    if [[ -n "$WIFIPASS" ]]; then
        iwctl station wlan0 connect "$SSID" --passphrase "$WIFIPASS"
        msg
    else
        iwctl station wlan0 connect "$SSID"
        msg
    fi
    ;;
esac

#!/bin/bash

SOUND_EFFECT="$HOME/dotfiles/.config/hypr/soundEffects/mixkit-software-interface-start-2574.wav"
BATTERY_CAPACITY_PATH="/sys/class/power_supply/BAT0/capacity"
BATTERY_STATUS_PATH="/sys/class/power_supply/BAT0/status"
# AUDIO_SINK="@DEFAULT_AUDIO_SINK@"
LOW_BATTERY_THRESHOLD=20
SLEEP_DURATION_LOW=180
SLEEP_DURATION_NORMAL=10
# VOLUME_THRESHOLD=0.65
while true; do
    bat_status=$(cat "$BATTERY_STATUS_PATH")
    if [ "$bat_status" = "Charging" ]; then
        sleep "$SLEEP_DURATION_NORMAL"
        continue
    fi

    bat_lvl=$(cat "$BATTERY_CAPACITY_PATH")
    if [ "$bat_lvl" -gt "$LOW_BATTERY_THRESHOLD" ]; then
        sleep "$SLEEP_DURATION_NORMAL"
        continue
    fi

    notify-send --urgency=CRITICAL "Battery Low" "Level: ${bat_lvl}%"
    paplay "$SOUND_EFFECT"
    sleep "$SLEEP_DURATION_LOW"
done

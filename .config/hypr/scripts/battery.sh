#!/bin/bash

SOUND_EFFECT="$HOME/dotfiles/.config/hypr/soundEffects/mixkit-software-interface-start-2574.wav"
BATTERY_PATH="/sys/class/power_supply/BAT0/capacity"
AUDIO_SINK="@DEFAULT_AUDIO_SINK@"
LOW_BATTERY_THRESHOLD=20
SLEEP_DURATION_LOW=300
SLEEP_DURATION_NORMAL=10
VOLUME_THRESHOLD=0.65

while true; do
    bat_lvl=$(cat "$BATTERY_PATH")
    if [ "$bat_lvl" -le "$LOW_BATTERY_THRESHOLD" ]; then
        notify-send --urgency=CRITICAL "Battery Low" "Level: ${bat_lvl}%"
        initial_volume=$(wpctl get-volume "$AUDIO_SINK" | awk '{print $2}')
        if wpctl get-volume "$AUDIO_SINK" | grep -q '\[MUTED\]'; then
            wpctl set-mute "$AUDIO_SINK" 0
        fi
        if (($(echo "$initial_volume < $VOLUME_THRESHOLD" | bc -l))); then
            wpctl set-volume "$AUDIO_SINK" "$VOLUME_THRESHOLD"
            paplay "$SOUND_EFFECT"
            wpctl set-volume "$AUDIO_SINK" "$initial_volume"
        else
            paplay "$SOUND_EFFECT"
        fi
        sleep "$SLEEP_DURATION_LOW"
    else
        sleep "$SLEEP_DURATION_NORMAL"
    fi
done

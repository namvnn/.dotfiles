now=$(date +'%Y-%m-%d %X')

battery=$(upower --show-info $(upower --enumerate | grep 'BAT'))
battery_state=$(grep -E 'state' <<<"${battery}" | awk '{print $2}')
battery_percentage=$(grep -E 'percentage' <<<"${battery}" |  awk '{print $2}')

audio=$(amixer -M get Master) 
audio_volumne=$(grep -E 'Front Left:' <<<"${audio}" | awk '{print $5}' | tr -d [])

echo "Audio: ${audio_volumne} | Battery: ${battery_state} ${battery_percentage} | ${now}"

#!/bin/sh
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do
	sleep 1;
done

# Launch 'MyBar'
export MONITOR=$(xrandr -q | grep primary | sed -e 's/\s.*$//g')
polybar MyBar &
echo "Polybar launched..."

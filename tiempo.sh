#!/bin/bash
printf "\nFecha: "
cat /sys/class/rtc/rtc0/date
printf "Hora: "
cat /sys/class/rtc/rtc0/time
echo ""

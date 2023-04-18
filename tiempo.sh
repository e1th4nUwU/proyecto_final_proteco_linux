#!/bin/bash
printf "\n\e[1;36mFecha:\e[0m "
cat /sys/class/rtc/rtc0/date
printf "\e[1;36mHora:\e[0m "
cat /sys/class/rtc/rtc0/time
echo ""

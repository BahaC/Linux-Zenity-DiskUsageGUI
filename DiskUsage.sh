#!/bin/sh

(
echo "25" ; sleep 0.5
echo "# Calculating Disk Size" ; sleep 0.5
echo "50" ; sleep 0.5
echo "# Calculating Disk Usage" ; sleep 0.5
echo "75" ; sleep 0.5
echo "# Calculating Disk Info" ; sleep 0.5
echo "100" ; sleep 0.5
) |
zenity --progress \
  --title="Calculate Disk Usage" \
  --text="Scanning Disk" \
  --percentage=0 \
  --width=500 \
  --height=300 \
  --auto-close \

if [ "$?" = -1 ] ; then
        zenity --error \
          --text="Calculation canceled."
fi

zenity --progress \
  --title="Disk Info" \
  --width=500 \
  --height=300 \
  --text="Calculation Ended. Current usage shown below
  ($(lsblk --output FSUSED -n -d /dev/sda3) / $(lsblk --output SIZE -n -d /dev/sda3) )
  ( %$(df --output=pcent /home/$USER | tr -dc '0-9') )" \
  --percentage=$(df --output=pcent /home/$USER | tr -dc '0-9')

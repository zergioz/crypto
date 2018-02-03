#!/bin/bash

MY_WATT="120"
MY_CLOCK="150"
MY_MEM="800"
MY_FAN="85"


export DISPLAY=:0

# Graphics card 1 to 5
for MY_DEVICE in {0..4}
do
	# Check if card exists
	if nvidia-smi -i $MY_DEVICE >> /dev/null 2>&1; then
		nvidia-settings  -c :0 -a "[gpu:$MY_DEVICE]/GPUPowerMizerMode=1"
		# Fan speed
		nvidia-settings  -c :0 -a "[gpu:$MY_DEVICE]/GPUFanControlState=1"
		nvidia-settings  -c :0 -a "[fan:$MY_DEVICE]/GPUTargetFanSpeed=$MY_FAN"
		# Graphics clock
		nvidia-settings  -c :0 -a "[gpu:$MY_DEVICE]/GPUGraphicsClockOffset[3]=$MY_CLOCK"
		# Memory clock
		nvidia-settings  -c :0 -a "[gpu:$MY_DEVICE]/GPUMemoryTransferRateOffset[3]=$MY_MEM"
                # Set watt/powerlimit. This is also set in miner.sh at autostart.
                sudo nvidia-smi -i "$MY_DEVICE" -pl "$MY_WATT"
	fi
done

echo
echo "Done"
echo

#!/bin/bash

#check if abc is running
if pgrep ccminer >/dev/null 2>&1
	then
     		# abc is running
		echo "Miner Running"
  	else

		# run miner
		echo "Starting Miner"
		sh /home/othello/Documents/crypto/zclassic-ccminer.sh
fi

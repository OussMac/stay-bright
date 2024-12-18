#!/bin/bash
CB=$(xrandr --verbose | grep -i brightness | cut -f2- -d ' ')
NB=$(echo "$CB + 0.1" | bc)

Display=$(xrandr |grep " connected" | cut -f1 -d ' ')

if [ $(echo "$NB <= 1.0" | bc -l) -eq 1 ];then
	xrandr --output $Display --brightness $NB
fi

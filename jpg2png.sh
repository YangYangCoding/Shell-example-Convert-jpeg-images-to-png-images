#!/bin/sh


for img in *
do
	tempname=`echo "$img"|sed -e 's/...$/jpg/'`
	checkname=`echo "$img"|sed -e 's/...$/png/'`
	if test "$img" = "$tempname" #check if the img name ends with jpg
	then
		picpng=`echo "$img"|sed -e 's/jpg$/png/'`
		convert "$img" "$picpng"
		rm "$img"
	fi
	if test "$img" = "$checkname"
	then
		echo "$img already exists"
	fi
done

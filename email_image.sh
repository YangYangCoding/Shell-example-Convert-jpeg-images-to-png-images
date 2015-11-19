#!/bin/sh


for img in "$@"
do
	display "$img"
	echo "Address to e-mail this image to?"
	read emailadd
	if test "$emailadd" = ""
	then
		exit 1
	fi
	echo "Message to accompany image?"
 	read message
	topic=`echo "$img"|sed -e 's/....$//'`
	echo "$message"|mutt -s "$topic" -a $img -- "$emailadd"
	echo "$img sent to $emailadd"
done


#! /bin/bash
echo "flipping a coin and displays head or tail wins"
head=0
tail=1
((diff=tail-head+1))
first_flip=$((head+$((RANDOM%diff))))
if [ $first_flip -eq 0 ]
then
	echo "Head win"
else
	echo "Tail win"
fi

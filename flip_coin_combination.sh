#! /bin/bash 
echo "flipping a coin and displays head or tail wins"
head=0
tail=1
((diff=tail-head+1))
head_count=0
tail_count=0
count=0
declare -A singlet=( [Head]=0 [Tail]=0 )
while [ $count -lt 10 ]
do
	first_flip=$((head+$((RANDOM%diff))))
	if [ $first_flip -eq 0 ]
	then
		singlet[Head]=$((${singlet[Head]}+1))
	else
		singlet[Tail]=$((${singlet[Tail]}+1))
	fi
((count++))
done
echo ${!singlet[@]}
echo ${singlet[@]}
per_head=`echo ${singlet[Head]} $count | awk '{ print ($1/$2)*100 }'`
per_tail=`echo ${singlet[Tail]} $count | awk '{ print ($1/$2)*100 }'`
echo "percentage of the singlet combination of head : $per_head%"
echo "percentage of the singlet combination of tail : $per_tail%"

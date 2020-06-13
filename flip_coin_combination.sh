#! /bin/bash
echo "flipping a coin and displays head or tail wins"
head=0
tail=1
((diff=tail-head+1))
head_count=0
tail_count=0
count=0
declare -A triplet=( [000]=0 [001]=0 [010]=0 [011]=0 [100]=0 [101]=0 [110]=0 [111]=0 )
while [ $count -lt 10 ]
do
	first_coin=$((head+$((RANDOM%diff))))
	second_coin=$((head+$((RANDOM%diff))))
	third_coin=$((head+$((RANDOM%diff))))
	triplet[$first_coin$second_coin$third_coin]=$((${triplet[$first_coin$second_coin$third_coin]}+1))
((count++))
done
echo ${!triplet[@]}
echo ${triplet[@]}
declare -a key_array=(${!triplet[@]})
declare -a key_value=(${triplet[@]})
for (( i=0; i<${#triplet[@]}; i++ ))
do
	percentage=`echo ${key_value[$i]} $count | awk '{ print ($1/$2)*100 }'`
	echo "percentage of the triplet combination of ${key_array[$i]} : $percentage%"
done

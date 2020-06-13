#! /bin/bash
echo "flipping a coin and displays head or tail wins"
head=0
tail=1
((diff=tail-head+1))
head_count=0
tail_count=0
count=0
declare -A doublet=( [00]=0 [01]=0 [10]=0 [11]=0 )
while [ $count -lt 10 ]
do
	first_coin=$((head+$((RANDOM%diff))))
	second_coin=$((head+$((RANDOM%diff))))
	doublet[$first_coin$second_coin]=$((${doublet[$first_coin$second_coin]}+1))
((count++))
done
echo ${!doublet[@]}
echo ${doublet[@]}
declare -a key_array=(${!doublet[@]})
declare -a key_value=(${doublet[@]})
for (( i=0; i<${#key_array[@]}; i++ ))
do
	percentage=`echo ${key_value[$i]} $count | awk '{ print ($1/$2)*100 }'`
	echo "percentage of the doublet combination of ${key_array[$i]} : $percentage"
done


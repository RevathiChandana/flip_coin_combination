#! /bin/bash
echo "flipping a coin and displays head or tail wins"
head=0
tail=1
((diff=tail-head+1))
head_count=0
tail_count=0
count=0
declare -A triplet=( [HHH]=0 [HHT]=0 [HTH]=0 [HTT]=0 [THH]=0 [TTH]=0 [THT]=0 [TTT]=0 )
while [ $count -lt 10 ]
do
	first_coin=$((head+$((RANDOM%diff))))
	second_coin=$((head+$((RANDOM%diff))))
	third_coin=$((head+$((RANDOM%diff))))
	if [[ $first_coin -eq 0 && $second_coin -eq 0 && $third_coin=0 ]]
	then
		triplet[HHH]=$((${triplet[HHH]}+1))
        elif [[ $first_coin -eq 0 && $second_coin -eq 0 && $third_coin=1 ]]
        then
                triplet[HHT]=$((${triplet[HHT]}+1))
        elif [[ $first_coin -eq 0 && $second_coin -eq 1 && $third_coin=0 ]]
        then
                triplet[HTH]=$((${triplet[HTH]}+1))
        elif [[ $first_coin -eq 0 && $second_coin -eq 1 && $third_coin=1 ]]
        then
                triplet[HTT]=$((${triplet[HTT]}+1))
        elif [[ $first_coin -eq 1 && $second_coin -eq 0 && $third_coin=0 ]]
        then
                triplet[THH]=$((${triplet[THH]}+1))
        elif [[ $first_coin -eq 1 && $second_coin -eq 0 && $third_coin=1 ]]
        then
                triplet[THT]=$((${triplet[THT]}+1))
        elif [[ $first_coin -eq 1 && $second_coin -eq 1 && $third_coin=0 ]]
        then
                triplet[TTH]=$((${triplet[TTH]}+1))
        else
                triplet[TTT]=$((${triplet[TTT]}+1))
	fi
((count++))
done
echo ${!triplet[@]}
echo ${triplet[@]}
per_HHH=`echo ${triplet[HHH]} $count | awk '{ print ($1/$2)*100 }'`
per_HHT=`echo ${triplet[HHT]} $count | awk '{ print ($1/$2)*100 }'`
per_HTH=`echo ${triplet[HTH]} $count | awk '{ print ($1/$2)*100 }'`
per_HTT=`echo ${triplet[HTT]} $count | awk '{ print ($1/$2)*100 }'`
per_THH=`echo ${triplet[THH]} $count | awk '{ print ($1/$2)*100 }'`
per_THT=`echo ${triplet[THT]} $count | awk '{ print ($1/$2)*100 }'`
per_TTH=`echo ${triplet[TTH]} $count | awk '{ print ($1/$2)*100 }'`
per_TTT=`echo ${triplet[TTT]} $count | awk '{ print ($1/$2)*100 }'`

echo "percentage of the triplet combination of HHH : $per_HHH%"
echo "percentage of the triplet combination of HHT : $per_HHT%"
echo "percentage of the triplet combination of HTH : $per_HTH%"
echo "percentage of the triplet combination of HTT : $per_HTT%"
echo "percentage of the triplet combination of THH : $per_THH%"
echo "percentage of the triplet combination of THT : $per_THT%"
echo "percentage of the triplet combination of TTH : $per_TTH%"
echo "percentage of the triplet combination of TTT : $per_TTT%"

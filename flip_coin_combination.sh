#! /bin/bash
echo "flipping a coin and displays head or tail wins"
head=0
tail=1
((diff=tail-head+1))
head_count=0
tail_count=0
count=0
declare -A doublet=( [HH]=0 [HT]=0 [TH]=0 [TT]=0 )
while [ $count -lt 10 ]
do
	first_coin=$((head+$((RANDOM%diff))))
	second_coin=$((head+$((RANDOM%diff))))
	if [[ $first_coin -eq 0 && $second_coin -eq 0 ]]
	then
		doublet[HH]=$((${doublet[HH]}+1))
	elif [[ $first_coin -eq 0 && $second_coin -eq 1 ]]
	then
		doublet[HT]=$((${doublet[HT]}+1))
        elif [[ $first_coin -eq 1 && $second_coin -eq 0 ]]
        then
                doublet[TH]=$((${doublet[TH]}+1))
	else
		doublet[TT]=$((${doublet[TT]}+1))
	fi
((count++))
done
echo ${!doublet[@]}
echo ${doublet[@]}
per_HH=`echo ${doublet[HH]} $count | awk '{ print ($1/$2)*100 }'`
per_HT=`echo ${doublet[HT]} $count | awk '{ print ($1/$2)*100 }'`
per_TH=`echo ${doublet[TH]} $count | awk '{ print ($1/$2)*100 }'`
per_TT=`echo ${doublet[TT]} $count | awk '{ print ($1/$2)*100 }'`
echo "percentage of the doublet combination of HH : $per_HH%"
echo "percentage of the doublet combination of HH : $per_HT%"
echo "percentage of the doublet combination of HH : $per_TH%"
echo "percentage of the doublet combination of HH : $per_TT%"

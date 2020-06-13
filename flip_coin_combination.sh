#! /bin/bash
echo "flipping a coin and displays head or tail wins"
head=0
tail=1
((diff=tail-head+1))
head_count=0
tail_count=0
count=0
declare -A dictionary=( [0]=0 [1]=0 [00]=0 [01]=0 [10]=0 [11]=0 [000]=0 [001]=0 [010]=0 [011]=0 [100]=0 [101]=0 [110]=0 [111]=0 )
while [ $count -lt 10 ]
do
        first_coin=$((head+$((RANDOM%diff))))
        second_coin=$((head+$((RANDOM%diff))))
        third_coin=$((head+$((RANDOM%diff))))
        dictionary[$first_coin$second_coin]=$((${dictionary[$first_coin$second_coin]}+1))
        dictionary[$first_coin]=$((${dictionary[$first_coin]}+1))
        dictionary[$first_coin$second_coin$third_coin]=$((${dictionary[$first_coin$second_coin$third_coin]}+1))
((count++))
done
echo "dic valuess : ${dictionary[@]}"
echo "dic keys : ${!dictionary[@]}"
declare -a key_array=(${!dictionary[@]})
declare -a key_value=(${dictionary[@]})
echo "BEFORE SORTING"
echo "key array : ${key_array[@]} "
echo "key value : ${key_value[@]}"
for (( i=0; i<${#dictionary[@]}; i++ ))
do
        for (( j=i+1; j<${#dictionary[@]}; j++ ))
        do
                if [ ${key_value[$i]} -gt ${key_value[$j]} ]
                then
                        temp_value=${key_value[$i]};
                        key_value[$i]=${key_value[$j]};
                        key_value[$j]=$temp_value;
                        temp_key=${key_array[$i]};
                        key_array[$i]=${key_array[$j]};
                        key_array[$j]=$temp_key;
                fi
        done

done
echo "AFTER SORTING"
echo "key array = ${key_array[@]}"
echo "key value = ${key_value[@]}"
i=$((${#key_array[@]}-1))
max_value=${key_value[$i]}
echo " winnig keys"
while [ $i -ne 0 ]
do
        if [ $max_value -eq ${key_value[$i]} ]
        then
                echo "key : ${key_array[$i]}---value : ${key_value[$i]}"
        fi
((i--))
done


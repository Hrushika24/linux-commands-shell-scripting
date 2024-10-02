#! /bin/bash
echo $(tail -n 7 "$1" | cut -f6) > "$2"
#assign the values to the array
readarray -t week_fc < "$2"
for i in ${!week_fc[@]}; do
    if [[ ${week_fc[$i]} -lt 0 ]]
    then
      week_fc[$i]=$((-${week_fc[$i]}))
    fi
    #echo ${week_fc[$i]}
done

mini=${week_fc[1]}
maxi=${week_fc[1]}

for item in ${week_fc[@]}; do
 if [[ $item < $mini ]]
  then
    mini=$item
 fi

 if [[ $item > $maxi ]]
   then
     maxi=$item
 fi
done
 
echo "minimum forecast acuuracy is $mini"
echo "maximum forecat acuuracy is $maxi"
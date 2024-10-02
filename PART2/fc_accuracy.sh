#! /bin/bash

#Tip: Your weather report must have at least two days of data for this calulation to make sense.
line_count=$(tail -n +2 "$1" | wc -l)
for((i=2; i<=$line_count; i++)); do
    yesterday_fc=$(head -n $i "$1" | tail -1 | cut -d $'\t' -f5 | tr -d -c '0-9-')
    #today_temp=$(sed -n "${i}p" "$1" | cut -d $'\t' -f4 | tr -d -c '0-9-')
    today_temp=$(head -n $(($i+1)) "$1" | tail -1 | cut -d $'\t' -f4 | tr -d -c '0-9-')
    accuracy=$(($yesterday_fc-$today_temp))

#echo "accuracy is $accuracy"

if [ -1 -le $accuracy ] && [ $accuracy -le 1 ]
then
           accuracy_range=excellent
elif [ -2 -le $accuracy ] && [ $accuracy -le 2 ]
   then
               accuracy_range=good
       elif [ -3 -le $accuracy ] && [ $accuracy -le 3 ]
       then
                   accuracy_range=fair
           else
                       accuracy_range=poor
fi

#echo "Forecast accuracy is $accuracy_range"

row=$(head -n $(($i+1)) "$1" | tail -1 )
year=$( echo $row | cut -d " " -f1)
month=$( echo $row | cut -d " " -f2)
day=$( echo $row | cut -d " " -f3)
echo -e "$year\t$month\t$day\t$today_temp\t$yesterday_fc\t$accuracy\t$accuracy_range"
unset year month day today_temp yesterday_fc accuracy accuracy_range
done
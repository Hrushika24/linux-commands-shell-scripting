#! /bin/bash
 
#Assign city name as kansas
city=kansas

#Obtain the weather report for kansas
#curl -s wttr.in/$city?T --output weather_report

#To extract Current Temperature
obs_temp=$(curl -s wttr.in/$city?T | grep -m 1 '°.' | grep -Eo -e '-?[[:digit:]].*' | tr -d ' ')
#echo "The current Temperature of $city: $obs_temp"

# To extract the forecast tempearature for noon tomorrow
fc_temp="$(curl -s wttr.in/$city?T | head -23 | tail -1 | grep '°.' | cut -d 'C' -f2 | grep -Eo -e '-?[[:digit:]].*' | tr -d ' ')C"
#echo "The forecasted temperature for noon tomorrow for $city : $fc_temp"

#Assign Country and City to variable TZ
TZ='America/Chicago'


# Use command substitution to store the current day, month, and year in corresponding shell variables:
hour=$(TZ='America/Chicago' date -u +%H)
day=$(TZ='America/Chicago' date -u +%d)
month=$(TZ='America/Chicago' date +%m)
year=$(TZ='America/Chicago' date +%Y)

# Log the weather
echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp"
#record=$(echo -e "$year\t$month\t$day\t$obs_temp\t$fc_temp")
#echo $record>>rx_poc.log

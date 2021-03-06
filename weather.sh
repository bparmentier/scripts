#!/bin/bash
# 
# This script was originally created by exiled.
# Source: http://usalug.com/phpBB3/viewtopic.php?t=14931

location=Brussels

#var_url="http://www.google.com/ig/api?weather=$zipcode&hl=en"
var_url="https://www.google.com/ig/api?weather=$location&hl=en&referrer=googlecalendar"

var_weather_wget=`wget -q $var_url -O -`
var_weather_xml=`echo "$var_weather_wget" | sed 's/<forecast_conditions>.*//'`
var_weather=`echo "$var_weather_xml" | sed 's/></>\n</g'`

#var_date=`echo "$var_weather" | grep -e '<forecast_date' | \
#sed -e 's/<forecast_date data="//' -e 's/"\/>//'`

#var_city=`echo "$var_weather" | grep -e '<city' | \
#sed -e 's/<city data="//' -e 's/"\/>//'`

var_condition=`echo "$var_weather" | grep -e '<condition' | \
sed -e 's/<condition data="//' -e 's/"\/>//'`

var_temp_c=`echo "$var_weather" | grep -e '<temp_c' | \
sed -e 's/<temp_c data="//' -e 's/"\/>//'`

#var_humidity=`echo "$var_weather" | grep -e '<humidity' | \
#sed -e 's/<humidity data="//' -e 's/"\/>//'`

#var_wind=`echo "$var_weather" | grep -e '<wind' | \
#sed -e 's/<wind_condition data="//' -e 's/"\/>//'`

#echo "Date: $var_date"
#echo "City: $var_city"
#echo "Condition: $var_condition"
#echo "Temp: $var_temp_c Deg. Celsius"
#echo "$var_humidity"
#echo "$var_wind"

var_day=$(LC_TIME=en_US date +"%A")
var_time=$(LC_TIME=en_US date +"%H:%M")

echo "Hello Master. It is time to wake up. We are $var_day and it is $var_time."
echo "It is $var_temp_c degrees outside and the weather is $var_condition."
echo "Have a nice day and may the force be with you!"

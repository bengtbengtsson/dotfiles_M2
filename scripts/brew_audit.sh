#!/bin/bash
ls -lt /opt/homebrew/Cellar | awk 'NR>1 {print $6, $7, $8, $9}' | while read -r month day time_or_year name; do
if [[ $time_or_year =~ ^[0-9]{2}:[0-9]{2}$ ]]; then
	year=$(date +%Y)
	date_str="$month $day $year $time_or_year"
	format_str="%b %d %Y %H:%M"
else
	date_str="$month $day $time_or_year"
	format_str="%b %d %Y"
fi
date -j -f "$format_str" "$date_str" "+%Y-%m-%d $name"
done

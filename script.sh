#!/bin/bash
>a.out
total_fopt=0
total_time=0
#run the octave file 10 times
for i in `seq 1 20`;
        
	do
		octave data_place.m >> a.out    
    	done 
#read two lines at a time from a.out
while read -r line1; read -r line2
do 
	#split line using '='
	IFS='='
	read -a split_opt <<< "${line1}"
    	read -a split_time<<< "${line2}"
	
	fopt=${split_opt[1]}
	time=${split_time[1]}

	#cumilitive sum of fopt and time 
	total_fopt=$(awk "BEGIN {printf \"%.2f\",${total_fopt}+${fopt}; exit(0)}")
	total_time=$(awk "BEGIN {printf \"%.2f\",${total_time}+${time}; exit(0)}")
    #echo "Two lines $line1 and $line2"	
done < a.out
#average of fopt and time
avg_fopt=$(awk "BEGIN {printf \"%.2f\",${total_fopt}/20; exit(0)}") 
avg_time=$(awk "BEGIN {printf \"%.2f\",${total_time}/20; exit(0)}") 
echo $avg_fopt
echo $avg_time


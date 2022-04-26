#!/bin/bash
#analyze csv file 

Input=/home/student/jzheng1/weile/weile-learning/credit_data.csv

#test


id=()
income=()
age=()
loan=()

OLD_IFS="$IFS"
IFS=','
header=1
while read id_one income_one age_one loan_one
do
    if [ $header -eq 1 ];then
        header=0
        continue
    fi
#    if [ ${#income_one} -eq 0 ]; then
#        echo "error: $id_one $income_one $age_one $loan_one"
#    fi
#    id+=($id)
    income+=($income_one)
#    age+=($age)
    loan+=($loan)
done < $Input

#echo "array size: ${#income[@]}, first[0]: ${income[0]}"

IFS="$OLD_IFS"

Simulator(){
    trials=0
    while [ "$trials" -lt "$trial" ];
        do 
			total=0
			j=0
            while [ "$j" -lt $samplesize ];do
               #let recordnum=${#income[@]}
                random=${income[$RANDOM%${#income[@]}]}
                total=$(echo "scale=5; $total+$random" | bc )
                j=$((j+=1))
            done
            echo "scale=5; $total/$samplesize" | bc
            #trials=$((trials+=1))
            ((trials+=1))
        done
}

samplesize=10
trial=30
Simulator "$samplesize" "$trial"

#read -p "Enter the path to your credit csv file: " csv
#select task in "Check CSV FILE" "Start Random Sampling Simulation" "Exit"
#do
#    if [ "$task" = "Check CSV FILE" ];then
#        cat $csv
#        echo "Not your CSV file? Restart the simulator to see if you correctly entered your path."
#
#    elif [ "$task" = "Start Random Sampling Simulation" ];then 
#        read -p "Enter the samplesize for calculating averages: " samplesize
#        read -p "Enter the number of trials needed: " trial
#        Simulator "$samplesize" "$trial"
#
#    elif [ "$task" = "Exit" ];then
#        echo "Ctrl C Please"
#    fi
#
#done 
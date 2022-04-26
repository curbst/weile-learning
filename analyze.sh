#!/usr/bin/bash

#Mar 10,2022
#本脚本分析f文件，并一次随机读取g条记录统计出平均数，累计执行n次统计
#具体要求：analyze.sh带参数:
#   analyze.sh -f "./credit_data.csv" -g 100  -n 60
#提示：
#1）脚本程序要使用getopts命令，并分析判断f文件是否存在，-g和-n参数后面是否是数字。如果-g参数的数字大于cvs文件记录条数，那么要提示：文件累计记录数小于一次提取数
#2）脚本要用read读取f文件的一条记录，并配合while命令读取全部记录
#3）把一行记录放到关联数组（declare -A申明的数组）中，
#        如第1条记录放到A["1"]
#        如第2条记录放到A["2"]
#        如第3条记录放到A["3"]
#        .....
#4) 要用到((express)),数学计算，计算平均数
#5）把程序结果显示在屏幕：
#   “第1次随机统计g条记录，xx平均数是：xxx
#   “第2次随机统计g条记录，xx平均数是：xxx
#   “第3次随机统计g条记录，xx平均数是：xxx
#   “第4次随机统计g条记录，xx平均数是：xxx
#   “第n次随机统计g条记录，xx平均数是：xxx

#5)程序要trap EXIT信号，表示程序退出的时候，要把之前使用的遍历A["1"],A["2"]...变量删除(unset)

g_FILENAME="./credit_data.csv"
g_G=10
g_N=2
parse_opts_func #调用命令行参数

g_RECORDS=0 #csv文件里面的记录总数

trap program_close_func EXIT #trap EXIT信号

declare -A R
header=1
while read line; do
    if [ ${header} -eq 1 ]; then header=0;continue; fi
    R[${g_RECORDS}]=${line}
    #echo ${R[${g_RECORDS}]}
    let g_RECORDS++;
done <${g_FILENAME}
echo "${g_FILENAME} have: ${g_RECORDS} records"

#set |egrep "^a[0-9]{1,4}"


function parse_opts_func() {
    echo "parse_opts_func()"
}

#从0 - g_RECORDS之间产生随机数
#参考https://www.cxybb.com/article/weixin_34055910/91566894
function my_rand_func() {
    min=$1
    max=$2
    ((retnum=$RANDOM%$max+$min))
    echo ${retnum}
}

#取出rand_str对应的记录，并计算total，便于后面计算平局数
function calc_groupavg_func() {
    local i=0
    rand_str=""
    for ((i=0; i<${g_G}; i++)); do
        rand=$(my_rand_func 0 $g_RECORDS)
        rand_str="${rand_str} ${rand}"
    done
    #echo "rand_str=${rand_str}"


    local total="0"
    for i in ${rand_str}; do
OLD_IFS="$IFS"
IFS=","
        one_record_array=(${R[${i}]})
IFS="$OLD_IFS"
        #echo "one_record_array=${one_record_array[@]}"
        #$((total+=${one_record_array[1]})) #不支持小数运算
        total=$(echo ${total}+${one_record_array[1]}|bc)
        #total=`echo ${total}+${one_record_array[1]}|bc`
    done
    #echo "total=${total}"


    #g_AVG=$((total / g_G)) #计算平局值，不确定是否支持小数
    g_AVG=`echo scale=5\;${total}/${g_G}|bc`
    #echo ${g_AVG}
}

echo "g_N=$g_N"
g_AVG=0
for ((i=0; i<${g_N}; i++)); do
    calc_groupavg_func
    echo "第${i}次随机统计${g_G}条记录,平均数是:${g_AVG}"
done


#程序退出前执行的function
function program_close_func() {
    echo "program is closing..."
}

#程序出现各种错误的时候，显示错误信息，并以不同的exit x退出程序
#处理参数$1，是各种错误代码
#比如1:脚本参数不完整
#比如2:-f参数的文件不存在
#比如3:-g参数>文件记录数
#比如4:CSV文件内容有不完整记录
function show_error_func() {
    error=$1
    case error in
    1) ;;
    2) ;;
    3) ;;
    *) ;;
    esac
    echo "show_error_func"
}

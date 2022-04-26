#!/bin/bash

IN_FILE=$1
LINE_NUM=$2
awk -vN=${LINE_NUM} -vC="`wc -l ${IN_FILE}`" '
BEGIN{
    srand();
    while(n<100)
    {
        i=int(rand()*C+1);
        if(!(i in a))
        {
            a[i]=1; 
            n++
        }
    }
}
NR in a{
    print $0

}' ${IN_FILE}

awk '
BEGIN{
    srand();
    n=0;
    while(n<100)
    {
        rand_num=int(rand()*2000+1); #2000+2才合理，因为要去掉csv文件的第一行
        if(!(rand_num in arr))       #判断一下，这个随机数是不是已经生成了，逻辑严谨，赞
        {
            arr[rand_num]=1;  #顺便赋个值，因为只是表示这个数组多了一个元素
            n++
        }
    }
}
NR in arr{
    print $0
}' credit_data.csv
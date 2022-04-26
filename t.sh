

awk '{
        for(i=1;i<=NF;i++){
            #print "a[" NR "," i "]=" $i
            a[NR,i]=$i
            printf "%d ", $i
        }
        print ""
        new_R=NF
        new_F=NR
    }
    
    END{
        print a[1,1]
        #print length(a)
        
            for(i=1;i<=new_R;i++){
                for(j=new_F;j>0;j--){
                    printf "%d ", a[j,i]
                }
                print ""
            }
        
        }
    
    ' digi.txt

a.txt

1 2 3 4 5 6
2 3 4 5 6 1
3 4 5 6 1 2
4 5 6 1 2 3


显示出来:
4 3 2 1 
5 4 3 2
6 5 4 3
1 6 5 4
2 1 6 5
3 2 1 6

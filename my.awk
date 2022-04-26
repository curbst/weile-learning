{


  print "NR=" NR " NF=" NF
  
  for(i=1;i<=NF;i++){
    a[NR,i]=$i  
    printf "%d ", $i
   }          
   print ""
}
END{

    print strftime("%Y %b %e %H:%M", 1648001909)

    printf "var from out:%d", iVar

    print "---------------------" 
    for(i=1;i<=NF;i++){
     for(j=NR;j>0;j--){
       printf "%d ", a[j,i]
    }
    printf "\n"
  }
}


json
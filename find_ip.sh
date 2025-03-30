#!/bin/bash
./script/CloudflareST -n 500 -tl 300  -f script/ip.txt -dd -p 20 
#-cfcolo CGD,FUO,FUK,FOC,CAN,HAK,SJW,HKG,TNA,JHB,KHH,KUL,PKX,LHW,OKA,KIX,TAO,ICN,SHA,SIN,NRT,KHN,ZGN,HYN,DPS,SZX,KWE,HGH,CZX,KMG,CGO,TYN,CSX,DLC,BHY,CKG,XFN,XNN,JXG,XIY,CTU,NNG,TNA,KCH,AKX,HAK,KHN,TEN
cnt=$(wc -l result.csv |cut -d' ' -f1)
if [ $cnt -gt 1 ]; then
	(( cnt = cnt  - 1 ))
  tail -n$cnt result.csv |awk -F, '{print $1}' >ip.csv
  git add ip.csv
  git commit -m "update ip"
  git push
fi

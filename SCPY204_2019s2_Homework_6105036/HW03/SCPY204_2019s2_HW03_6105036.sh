#!/bin/bash
file='COVID-19-geographic-disbtribution-worldwide-2020-04-12.txt'
OLDIFS=$IFS
IFS=$'\n'
a=0
ans1=0
ans2=0
ans3=0
for i in $(cat $file)
do
if [[ $i =~ "Thailand" ]] ;then
echo $i
IFS=$','
	for j in $i
	do 
		if [[ $a -ge 10 ]] ; then
			a=`expr $a \* 0`
		fi
	a=`expr $a + 1`
	b=`expr $a % 5`
	c=`expr $a % 6`
		if [[ $b -eq 0 && $a -ne 10 ]] ; then
		ans1=`expr $ans1 + $j`
		fi
		if [[ $c -eq 0 && $a -ne 10 ]] ; then
		ans2=`expr $ans2 + $j`
		fi
		if [[ $a -eq 10 ]] ; then
		ans3=`expr $j`
		fi
	done
	IFS=$OLDIFS
fi
done
echo -e "\033[34mThe percentage of the population that is infected is\033[0m"
awk "BEGIN {print (($ans1)/($ans3))*100}"
echo -e "\033[31mThe percentage of the population that has died is\033[0m"
awk "BEGIN {print (($ans2)/($ans3))*100}"
exit 0
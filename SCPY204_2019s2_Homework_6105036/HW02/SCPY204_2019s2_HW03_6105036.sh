#!/bin/bash
re='^[0-9]+$'
sym='[1 2 3 4 5]'
male='male'
female='female'
echo "Hello Welcome to Covid-19 Checker by $(basename $0)!  "
echo ""
echo "***Please add Infomation from analysis"
echo ""
read -p "Enter your name:" name
if ! [[ $name =~ $re ]] ; then
	if [[ -n $name ]] ; then
	read -p "Enter your age:" age
			if ! [[ $age =~ $re ]] ; then
			echo "error: It not a number!!!" ; exit 0
			else 
				if [[ $age -gt 120 ]] ; then
				echo "error: Age is so much!!!" ; exit 
				else 
					if [[ $age -le 0 ]] ; then
					echo "error: Age not is that!!!" ; exit 0
					else
					read -p "Enter your gender (male,female):" gender
						if [ $gender = male ] || [ $gender = female ]; then
						echo ""
						read -p "Do you have the following symptoms?
1.Fever
2.Cough
3.Sore throat
4.None of these symptoms
5.More than one symptom
" symptoms
							if ! [[ $symptoms =~ $sym ]] ; then
							echo ""
							echo "You enter the wrong information Please enter a new start" ; exit 0
							else
							echo ""
								if [[ $symptoms -eq 4 ]] ; then
								read -p "You have a history of traveling from 
China, Japan, Singapore, South Korea, Hong Kong, Taiwan, Macau, Italy, Iran
France, Germany or in areas with an coronary virus outbreak. 
New species in the period of 14 days before the onset of illness? (y/n)
" mytravel
								echo ""
								echo "Congratulation! You are free from Covid-19"
								else
								read -p "You have a history of traveling from 
China, Japan, Singapore, South Korea, Hong Kong, Taiwan, Macau, Italy, Iran, France, Germany or in areas with an coronary virus outbreak. 
New species in the period of 14 days before the onset of illness? (y/n)
" mytravel
									if [[ $mytravel =~ ^[Yy]$ ]] ; then
									echo ""
									echo "Please go to see a doctor right away!! You are at risk of Covid-19."
									else
									echo ""
									echo "Congratulation! You are free from Covid-19"
									fi
								fi
							fi	
						else
						echo "You need enter the information Please enter a new start" ; exit 0
						fi
					echo "You need enter the information Please enter a new start" ; exit 0
					fi


				fi
			fi
	else
    echo "You need enter the information Please enter a new start" ; exit 0
	fi 
else 
echo "error: It a number!!!" ; exit 0
fi

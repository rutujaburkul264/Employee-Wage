#!/bin/bash -x

isPartTime=1
isFullTime=2
totalSalary=0
maxHrsInMonth=4
empRatePerHr=20
numOfWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

function getWorkHrs()
{
	local $empCheck=$1
   case $empCheck in
 	$isFullTime)
         empHrs=8
            ;;
      $isPartTime)
         empHrs=4
            ;;
*)
empHrs=0
;;

esac
echo $empHrs
}
while [[ $totalEmpHrs -lt $maxHrsInmonth &&
			$totalWorkinDays -lt $numOfWorkingdays ]]
do
	((totalWorkingDays++))
	empcheck=$((RANDOM%3))
	empHrs="$( getWorkingHrs $empCheck )"
	totalEmpHrs=$(($totalEmpHrs+$empHrs))
done
totalSalary=$(($totalEmpHrs+$empRatePerHr));

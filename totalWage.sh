#!/bin/bash -x

isPartTime=1
isFullTime=2
MaxHrsInMonth=4
EmpRatePerHr=20
numOfWorkingDays=20

TotalEmpHrs=0
TotalWorkingDays=0

function getWorkingHrs()
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
function getEmpWage()
{
local $empHrs=$1
echo $(($empHrs+$EmpRatePerHr))
}
while [[ $TotalEmpHrs -lt $MaxHrsInMonth &&
			$TotalWorkingDays -lt $numOfWorkingDays ]]
do
	((TotalWorkingDays++))
	empCheck=$((RANDOM%3))
	empHrs="$( getWorkingHrs $empCheck )"
	TotalEmpHrs=$(($TotalEmpHrs+$empHrs))
	dailyWage[$TotalWorkingDays]="$( getEmpWage $empHrs )"
done
totalSalary=$(($TotalEmpHrs+$EmpRatePerHr))
echo ${dailyWage[@]}


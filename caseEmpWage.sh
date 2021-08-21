#!/bin/bash -x

isPartTime=1
isFullTime=2
empRatePerHr=20
randomCheck=$((RANDOM%2))

case $empCheck in 
	$isPartTime)
		empHrs=8
			;;
	$isFullTime)
		empHrs=4
			;;
*)
	empHrs=0
		;;
esac

salary=$(($empHrs+$empRatePerHr))

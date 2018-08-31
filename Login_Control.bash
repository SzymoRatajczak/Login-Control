echo "Type a name of the file"
read logname
time=0

grep "$logname"/etc/passwd>dev/null
if [ $? -eq 0 ]
then
   echo "Wait..."
else
   echo " user not found"
fi

while true
do
    who  grep "$logname" >dev/null
	if [ $? -eq 0 ]
	then
	    echo " $logname has logged in " 
		if [ $time -ne 0 ]
		then 
		     if [ $time -gt 60 ]
			 then
			     min=`expr $time/60`
				 sec=`expr $time %60`
				 echo "$logname was $min minutes and $sec seconds late"
			else
			     sec=$time
				 echo  "$logname was $sec seconds late to log in "
		    fi
			
		fi
		exit
	else
	    time=`expr $time+1
		sleep 1
	fi
done 
	

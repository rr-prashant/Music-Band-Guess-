#this function is called when the right band is guessed
band_func ()
{
	echo
    echo "CONGRATULATIONS! You have entered the correct band name."
	echo "----------------------------------------------------------------------------------------------"
	echo "|                                     BAND INFORMATION                                       |"
	echo "----------------------------------------------------------------------------------------------"
	echo "|Nirvana was an American rock band formed in Aberdeen, Washington in 1987. Founded  by       |"
	echo "|lead singer and guitarist Kurt Cobain and bassist Krist Novoselic, the band went through    |"
	echo "|a succession of drummers, most notably Chad Channing, before recruiting Dave Grohl in 1990. |"
	echo "|Nirvana's success popularized alternative rock, and they were often referenced as the       |" 
	echo "|figurehead band of Generation X. Their music maintains a popular following and continues to |"
	echo "|influence modern rock culture.                                                              |"                               
	echo "----------------------------------------------------------------------------------------------"
	echo
}

#this function is called after picking three band members
mem_func ()
{
	main3=0
	echo
	echo "Choose one: "
	echo $1 $2 $3 #this echo displays the option of three band members which were already choosen by the user, to again choose from
	arrVar=($1 $2 $3) #creating arraylist of the options of three selected band members
	while [ $main3 -eq 0 ] #while variable main3 is equal to 0, this loop will continue
	do
		echo "Enter corresponding id of band member you want to choose: "
		select i in ${arrVar[@]} #comparing each option with user input
		do
			case $i in
				"JL") #if user input equals to JL then below command is executed
					echo "---------------------------------------------------------------------------------------------"
					echo "|                                BAND MEMBER INFORMATION                                    |"
					echo "---------------------------------------------------------------------------------------------"
                	cat JL.txt 
					echo "---------------------------------------------------------------------------------------------"
					echo
					echo
            		((main3++))
					((main++))
					break
					;;
				"AY") #if user input equals to AY then below command is executed
					echo "------------------------------------------------------------"
					echo "|                BAND MEMBER INFORMATION                   |"
					echo "------------------------------------------------------------"
					echo "|     Sorry! there is no information about Angus Young.    |"
					echo "------------------------------------------------------------"
					echo
                	((main3++))
					break
					;;
				"FM") #if user input equals to FM then below command is executed
					echo "----------------------------------------------------------------------------"
					echo "|                          BAND MEMBER INFORMATION                         |"
					echo "----------------------------------------------------------------------------"
                	cat FM.txt 
					echo "----------------------------------------------------------------------------"    
					echo
					echo
                	((main3++))
					((main++))
					break
					;;
				"DH") #if user input equals to DH then below command is executed
					echo "------------------------------------------------------------"
					echo "|                BAND MEMBER INFORMATION                   |"
					echo "------------------------------------------------------------"
					echo "|     Sorry! there is no information about Debbie Harry.   |"
					echo "------------------------------------------------------------"
					echo
                	((main3++))
					break
					;;
				"KC") #if user input equals to KC then below command is executed
					echo "---------------------------------------------------------------------------------"
					echo "|                          BAND MEMBER INFORMATION                              |"
					echo "---------------------------------------------------------------------------------"
                	cat KC.txt
					echo "---------------------------------------------------------------------------------" 
					echo
					echo
                	((main3++))
					((main++))
					break
					;;
				*) #if user input does not equal to any of the above options then below command is executed
					echo "---------------------------------"
					echo "|         INVALID INPUT         |"
					echo "---------------------------------"
					echo "|     WRONG INPUT! TRY AGAIN    |"
					echo "---------------------------------"
					echo
					;;
			esac
		done
	done
}

sec_key="12345" #initializing secret password to a variable
turn=0
main=0

if [ -z $1 ] || [ -z $2 ]; #checking if parameters are empty or not
then
	echo "------------------------------------------------"
	echo "|            INVALID USERNAME/ID               |"
	echo "------------------------------------------------"
	echo "|  Please enter your username and id correctly.|"
	echo "------------------------------------------------"
	echo
else
	while (( $turn < 3 )) #checking turn 3 times
	do
		echo "Enter the secret key: "
		read skey
		if [ $skey -eq $sec_key ]; #comparing secret key
		then
			echo "WELCOME "$2 $1
            date #date is used to display current date and time
			while [ $main -eq 0 ] #while variable main is equal to 0 this loop continues
			do
				main1=0
				main2=0
				echo
				echo "MUSIC BANDS"
				echo "1. Beatles(BEA)"
				echo "2. AC/DC(AD)"
				echo "3. Queen(QUE)"
				echo "4. Blondie(BLO)"
				echo "5. Nirvana(NIR)"
				echo
				until [ $main1 -eq 1 ] #untill variable main1 is equal to 1 this loop continues
				do
					echo "Enter a band code: "
					read choice
					if [ $choice == "NIR" ] #keeping only one right guess band and if user enters same band code then band_func is called
					then
						band_func
						((main1++))
					else #if user guesses the wrong band then 
						echo "---------------------------------"
						echo "|         INVALID INPUT         |"
						echo "---------------------------------"
						echo "|     WRONG GUESS! TRY AGAIN    |"
						echo "---------------------------------"
						echo
					fi
				done
				while [ $main2 -eq 0 ] #while variable main2 is equal to 0, loop will continue
                do
					echo
                	echo "STAR BAND MEMBERS"
                	echo "1. John Lennon(JL)"
                	echo "2. Angus Young(AY)"
                	echo "3. Freddie Mercury(FM)"
                	echo "4. Debbie Harry(DH)"
                	echo "5. Kurt Cobain(KC)"
					echo
                    echo "Enter three members code: "
                    read choice1 choice2 choice3  #taking 3 band member id
					#checking if the all three IDs are valid id or not
					if [[ $choice1 != "JL"  && $choice1 != "AY" && $choice1 != "FM" && $choice1 != "DH" && $choice1 != "KC" ]] ||
					[[ $choice2 != "JL" && $choice2 != "AY" && $choice2 != "FM" && $choice2 != "DH" && $choice2 != "KC" ]] ||
					[[ $choice3 != "JL" && $choice3 != "AY" && $choice3 != "FM" && $choice3 != "DH" && $choice3 != "KC" ]]
					then 
						echo "---------------------------------"
						echo "|         INVALID INPUT         |"
						echo "---------------------------------"
						echo "|     INVALID INPUT! TRY AGAIN  |"
						echo "---------------------------------"
						echo
					elif [[ $choice1 == $choice2 ||  $choice1 == $choice3 ]] #checks if there are same IDs selected
					then
						echo "-------------------------------------"
						echo "|             INVALID INPUT         |"
						echo "-------------------------------------"
						echo "|  REPEATED INPUT FOUND! TRY AGAIN  |"
						echo "-------------------------------------"
						echo
					else #if everything is good then below command is executed
						((main2++))
						mem_func $choice1 $choice2 $choice3
					fi
                done
				if [ $main -gt 0 ] #when variable main is greater than 0 then below command is executed
				then
					echo "Enter "yes" or "y" to repeat or any other key to exit: "
					read ans
					if [ $ans == "yes" ] || [ $ans == "y" ] #checks if user enters yes or y then program continues or else program exits
					then
						main=0
					else
						exit 1
					fi
				fi
			done
		else
			((turn++)) #incrementing turn varibale to couont how many times does the user fails to enter correct password
		fi
	done
fi


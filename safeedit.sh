#Created by Gayan Kavirathne on 15 March 2019. Version 01

#sample Code as follows

#First give shell script permission to execute by
#sudo chmod +x safeedit.sh

#Now run the script as follows
#./safeedit.sh myfile.txt			(Command line mode)
#	    or
#./safeedit.sh 					(Interactive mode)

file="${1}"								#Reading commandline mode input
extra_param="${2}"								

if [ -z "$extra_param" ]						#Checking if there are more than one command line arguments
then
      echo "Got file name input : ${file}"
else
      echo "Too many command line arguments entered"			#there are two or more command line arguments
      exit 0
fi



if [ -z "$file" ]
then
      echo "\$file input is empty"					#Command line mode input is empty
      echo "Enter fully qualified path to the file : "
      read file								#Ask for file name
      if [ -z "$file" ]							#Check if the interactive argument is empty
      then
	  echo "invalid input, exitting...."				#Invalid/ empty input again
          exit 0 	
      fi
else
      echo "Checking the availability of backup file"			#Input not empty
fi	

if [ -f $file ]								#Check if file exists or not
then
      echo "Found File, creating a backup."				#File exists save a backup
      sudo cp $file $file".bak"
else
      echo "File Not found"						#No file found 
fi

echo "Opening the file with gedit"
gedit $file								#Opening file with nano

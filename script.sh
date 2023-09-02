#!/usr/bin/env bash

# Task 1: 
# The first argument provided from cmd must be the language you are running it in
# Just plainly print the first argument that was provided 
# The second argument is the name of the python file that must be run 
# Run the python file, using input1.txt as stdin, and write the output to a file user_output1.txt 
# Display user_output1.txt to the user as user output, and the file output1.txt as the expected output 

# Task 2: 
# The first line is no longer the language. 
# However, multiple files are provided as command line inputs.  
# Using a for loop, iterate through the remaining arguments, and run each file that has been passed as a command line argument 
# Additionally, you have to also iteratively execute each file on multiple test cases 
# Run each file: ex file.py on 3 input files: input1.txt, input2.txt, input3.txt, and store them in output files: user_output1.txt user_output2.txt user_output3.txt. For each iteration, display the expected output and the user output. 

for var in "$@"
do 
	echo "Running $var on test cases"
	for i in $(seq 3)
	do
		echo "Running test case $i:"
		cat input$i.txt | python3 $var > user_output$i.txt 
		echo "User output: " 
		cat user_output$i.txt 
		echo "Expected output: " 
		cat output$i.txt 
		echo "--------------------------------------------------------------"
	done
	echo "================================================================="
done

# Task 3: 
# Do not display expected output and user output in every iteration 
# If there is a difference in the user output and expected output, then display the user output and expected output seperately as done before. If there is no difference, then just print that test case passed 
# After you have tested your chnages, commit them to your branch 
